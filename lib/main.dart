import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/core/apptheme.dart';
import 'package:todo/core/box.dart';
import 'package:todo/cubit/get_cubit.dart';
import 'package:todo/cubit/simple_bloc_observer.dart';
import 'package:todo/cubit/theme/get_cubit.dart';
import 'package:todo/features/regester/views/regester_screen.dart';
import 'core/data/model/task_model.dart';
import 'cubit/theme/get_State.dart';
import 'features/add_task/data/cubit/add_task_cubit/add_task_cubit.dart';
import 'features/onboarding/views/onboarding_screen.dart';

void main() async {
  Bloc.observer=SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter() );
  var box = await Hive.openBox(BoxApp.kTaskBox);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetUserCubit()),
        BlocProvider(create: (context) => GetThemeCubit()),
      ],
      child: BlocBuilder<GetThemeCubit, GetThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              theme: AppTheme.lightThemeData,
              themeMode: context.read<GetThemeCubit>().isDark
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
