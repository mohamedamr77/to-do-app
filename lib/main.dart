import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/apptheme.dart';
import 'package:todo/core/box.dart';
import 'package:todo/features/regester/controller/get_cubit.dart';
import 'package:todo/cubit/simple_bloc_observer.dart';
import 'package:todo/cubit/theme/get_cubit.dart';
import 'package:todo/features/home_page/controller/home_page_Cubit.dart';
import 'package:todo/features/regester/views/regester_screen.dart';
import 'package:todo/service/lcoal_notification/local_notification_service.dart';
import 'core/data/model/task_model.dart';
import 'cubit/theme/get_State.dart';
import 'features/archived_tasks/controller/archived_task_cubit.dart';
import 'features/onboarding/views/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    LocalNotificationService.init(),
    // WorkManagerService().init(),
  ]);

  LocalNotificationService.requestPermission();

  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(BoxApp.kTaskBox);
  await Hive.openBox(BoxApp.kThemeBox);
  await Hive.openBox(BoxApp.kUserBox);
  // final isDark = Hive.box(BoxApp.kThemeBox).get('isDark',defaultValue: false,);
  runApp(
    BlocProvider(
      create: (context) => GetThemeCubit()..initTheme(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
// final bool isDark;
  @override
  Widget build(BuildContext context) {
    log(BlocProvider.of<GetThemeCubit>(context).isDark.toString());

    BlocProvider.of<GetThemeCubit>(context).setSwitchValueFromHive();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetUserCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(
          create: (context) => ArchivedTaskCubit(),
        ),
      ],
      child: BlocBuilder<GetThemeCubit, GetThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              theme: AppTheme.lightThemeData,
              themeMode: BlocProvider.of<GetThemeCubit>(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: AppTheme.darkThemeData,
              routes: {
                CustomRegesterScreen.id: (context) =>
                    const CustomRegesterScreen(),
                CustomOnboarding.id: (context) => const CustomOnboarding(),
                // HomePageScreen.id: (context) =>  HomePageScreen(),
              },
              initialRoute: CustomOnboarding.id,
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
