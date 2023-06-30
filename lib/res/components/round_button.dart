import 'package:flutter/material.dart';

import 'colors.dart';

class RoundButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPress;
  final bool loading;
  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.loading = false,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white70,
                )
              : Text(
                  title.toString(),
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                  ),
                ),
        ),
      ),
    );
  }
}
