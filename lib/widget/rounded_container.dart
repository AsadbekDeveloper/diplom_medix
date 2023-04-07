import 'package:diplom_medix/helper/colors.dart';
import 'package:diplom_medix/helper/shadow.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  const RoundedContainer({
    Key? key,
    required this.child,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: margin ?? const EdgeInsets.only(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.containerWhite,
        boxShadow: [
          commonShadow,
        ],
      ),
      child: child,
    );
  }
}
