import 'package:flutter/material.dart';
import '../theme.dart';

class ProgressRing extends StatelessWidget {
  final double percent;
  final double size;

  const ProgressRing({super.key, required this.percent, this.size = 44});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 4,
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: (percent / 100).clamp(0, 1),
              strokeWidth: 4,
              color: AppColors.green,
              backgroundColor: Colors.transparent,
            ),
          ),
          Text(
            '${percent.round()}%',
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.green),
          ),
        ],
      ),
    );
  }
}
