import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const AppButton({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(btnText),
      ),
    );
  }
}
