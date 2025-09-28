import 'package:flutter/material.dart';
import '../theme/otlob_theme.dart';
import 'by_restaurant_tag.dart';

class OtlobRestaurantCard extends StatelessWidget {
  final String name;
  final double rating;
  final int reviews;
  final String priceRange;
  final String eta;
  final List<String> microMenuImages;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;

  const OtlobRestaurantCard({
    super.key,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.priceRange,
    required this.eta,
    required this.microMenuImages,
    this.isFavorite = false,
    this.onTap,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 84,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                itemCount: microMenuImages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: OtlobColors.surfaceContainer,
                    child: Image.asset(
                      microMenuImages[index],
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.fastfood, size: 32, color: OtlobColors.textSecondary),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: OtlobColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber[700], size: 18),
                            const SizedBox(width: 4),
                            Text('$rating', style: TextStyle(fontWeight: FontWeight.w600)),
                            const SizedBox(width: 4),
                            Text('($reviews)', style: TextStyle(color: OtlobColors.textSecondary)),
                            const SizedBox(width: 12),
                            Text(priceRange, style: TextStyle(color: OtlobColors.textSecondary)),
                            const SizedBox(width: 8),
                            Text(eta, style: TextStyle(color: OtlobColors.textSecondary)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const ByRestaurantTag(),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? OtlobColors.primary : OtlobColors.textSecondary,
                    ),
                    onPressed: onFavorite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
