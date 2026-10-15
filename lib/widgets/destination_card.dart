import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../theme/app_colors.dart';
import 'mountain_image.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;
  const DestinationCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 185,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: SizedBox(
                height: 105,
                child: MountainImage(destination.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 5),
              child: Text(
                destination.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: AppColors.navy,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 15, color: AppColors.green),
                  Text(destination.country,
                      style: const TextStyle(fontSize: 12, color: AppColors.muted)),
                  const Spacer(),
                  const Icon(Icons.star, size: 16, color: Colors.amber),
                  Text(destination.rating,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
