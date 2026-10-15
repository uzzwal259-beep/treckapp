import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'mountain_image.dart';

class FeaturedTrekCard extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  const FeaturedTrekCard({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: 170,
        child: Stack(
          fit: StackFit.expand,
          children: [
            MountainImage(image),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xDD071521)],
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Featured',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  const SizedBox(height: 8),
                  const Text('Everest Base Camp Trek',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  const Text('The journey of a lifetime',
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                ],
              ),
            ),
            Positioned(
              right: 13,
              bottom: 24,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: AppColors.navy),
                  onPressed: onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
