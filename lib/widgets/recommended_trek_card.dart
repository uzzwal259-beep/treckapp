import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../theme/app_colors.dart';
import 'mountain_image.dart';

class RecommendedTrekCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;
  const RecommendedTrekCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F9FB),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(width: 112, height: double.infinity, child: MountainImage(destination.image)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(destination.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.navy)),
                  const SizedBox(height: 7),
                  Text('${destination.duration}  •  ${destination.difficulty}',
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 11, color: AppColors.muted)),
                  const SizedBox(height: 5),
                  Row(children: [
                    const Icon(Icons.location_on, color: AppColors.green, size: 14),
                    const Text('Nepal  ', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    Text(destination.rating, style: const TextStyle(fontSize: 11)),
                  ]),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: AppColors.navy),
          ],
        ),
      ),
    );
  }
}
