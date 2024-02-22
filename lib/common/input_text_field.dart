import 'package:flutter/material.dart';
import '/theme/colors/colors.dart';



/// Usage:
/// InputTextField("Top text", (newText) {
///   setState(() {
///     _topText = newText;
///   });
/// })
class InputTextField extends StatelessWidget {
  final String title;
  final Function(String) onTextChanged;
  final TextEditingController controller;

  const InputTextField(this.title, this.onTextChanged, this.controller,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(color: AppColors.mainGray),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: controller,
              onChanged: (value) => onTextChanged(value),
            ),
          ],
        ),
      ),
    );
  }
}
