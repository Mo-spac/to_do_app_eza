import 'package:flutter/material.dart';
import 'package:to_do_app_ageeza/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.primaryColor,
  });

  final void Function() onPressed;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final buttonBackgroundColor = backgroundColor ??
        Theme.of(context)
            .elevatedButtonTheme
            .style
            ?.backgroundColor
            ?.resolve({}) ??
        AppColors.primaryColor;

    return ElevatedButton(
      onPressed: onPressed,
      // style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
      //       backgroundColor: MaterialStateProperty.all(backgroundColor),
      //     ),

      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      child: Text(
        text,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
