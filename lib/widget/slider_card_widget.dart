import 'package:flutter/material.dart';
import 'package:second_project/resource/colors/colors.dart';

class SliderCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;
  const SliderCardWidget(
      {super.key, required this.title, required this.subtitle, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.55,
      child: Card(
        color: color ?? Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text(
              subtitle,
              style: TextStyle(color: deepPurple),
            )
          ],
        ),
      ),
    );
  }
}
