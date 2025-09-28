import 'package:flutter/material.dart';
import '../theme/otlob_theme.dart';

class ByRestaurantTag extends StatelessWidget {
  const ByRestaurantTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: OtlobColors.byRestaurantTagBg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.storefront, size: 18, color: OtlobColors.byRestaurantTagText),
          const SizedBox(width: 6),
          Text(
            'By Restaurant',
            style: Theme.of(context).chipTheme.labelStyle?.copyWith(
                  color: OtlobColors.byRestaurantTagText,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
