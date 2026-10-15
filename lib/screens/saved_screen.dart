import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 70, color: AppColors.green),
            SizedBox(height: 15),
            Text('Your Saved Treks', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.navy)),
            SizedBox(height: 8),
            Text('Your saved destinations will appear here.',
              textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted)),
          ],
        ),
      ),
    );
  }
}
