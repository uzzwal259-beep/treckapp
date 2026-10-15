import 'package:flutter/material.dart';

class MountainImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  const MountainImage(this.url, {super.key, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: double.infinity,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(
        color: const Color(0xFFDCEAF1),
        alignment: Alignment.center,
        child: const Icon(Icons.landscape, size: 55, color: Colors.blueGrey),
      ),
    );
  }
}
