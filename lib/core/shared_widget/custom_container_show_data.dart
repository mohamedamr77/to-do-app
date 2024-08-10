import 'package:flutter/material.dart';

class CustomContainerShowData extends StatelessWidget {
  const CustomContainerShowData(
      {super.key, required this.title, required this.detailsTitle});
  final String title;
  final String detailsTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).cardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(
            height: 7,
          ),
          Text(detailsTitle, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
