import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../theme/app_colors.dart';
import '../widgets/mountain_image.dart';

class TripDetailsScreen extends StatefulWidget {
  final Destination destination;
  const TripDetailsScreen({super.key, required this.destination});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.destination;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(fit: StackFit.expand, children: [
                MountainImage(d.image),
                Container(decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    colors: [Color(0x44000000), Colors.transparent]),
                )),
                Positioned(top: 55, left: 18, child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
                )),
                Positioned(top: 55, right: 18, child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : AppColors.muted),
                    onPressed: () => setState(() => isFavorite = !isFavorite),
                  ),
                )),
                Positioned(bottom: 18, left: 20, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(20)),
                  child: Text(d.difficulty, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                )),
              ]),
            ),
          ),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 18, 22, 25),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(d.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.navy)),
              const SizedBox(height: 12),
              Row(children: [
                const Icon(Icons.location_on, size: 17, color: AppColors.green),
                const SizedBox(width: 5),
                Text(d.country, style: const TextStyle(color: AppColors.muted)),
                const Spacer(),
                const Icon(Icons.star, color: Colors.amber, size: 19),
                const SizedBox(width: 4),
                Text(d.rating, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text(' (1.2k reviews)', style: TextStyle(fontSize: 12, color: AppColors.muted)),
              ]),
              const Divider(height: 30),
              Row(children: [
                Expanded(child: _stat(Icons.calendar_month, d.duration, 'Duration')),
                Expanded(child: _stat(Icons.terrain, d.difficulty, 'Difficulty')),
                Expanded(child: _stat(Icons.access_time, d.bestTime, 'Best Time')),
              ]),
              const Divider(height: 30),
              const Text('Overview', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.navy)),
              const SizedBox(height: 9),
              Text(d.overview, style: const TextStyle(height: 1.6, fontSize: 14, color: AppColors.muted)),
              const Divider(height: 30),
              const Text('Highlights', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.navy)),
              const SizedBox(height: 12),
              ...d.highlights.map((h) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(children: [
                  const Icon(Icons.check, color: AppColors.green, size: 20),
                  const SizedBox(width: 9),
                  Expanded(child: Text(h, style: const TextStyle(fontSize: 13, color: AppColors.muted))),
                ]),
              )),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(color: AppColors.mint, borderRadius: BorderRadius.circular(18)),
                child: Row(children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('From', style: TextStyle(fontSize: 12, color: AppColors.muted)),
                    Text(d.price, style: const TextStyle(fontSize: 28, color: AppColors.darkGreen, fontWeight: FontWeight.bold)),
                    const Text('per person', style: TextStyle(fontSize: 12, color: AppColors.muted)),
                  ])),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: AppColors.darkGreen, foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15)),
                    onPressed: () => showDialog(context: context, builder: (ctx) => AlertDialog(
                      title: const Text('Book Your Trek'),
                      content: Text('You selected ${d.name}. Booking confirmation is not connected yet.'),
                      actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
                    )),
                    icon: const Icon(Icons.arrow_forward, size: 18),
                    label: const Text('Book Now'),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                _BottomDetail(icon: Icons.map_outlined, label: 'Itinerary'),
                _BottomDetail(icon: Icons.check_circle_outline, label: 'Inclusions'),
                _BottomDetail(icon: Icons.star_border, label: 'Reviews'),
              ]),
            ]),
          )),
        ],
      ),
    );
  }

  Widget _stat(IconData icon, String value, String label) => Column(children: [
    Icon(icon, size: 21, color: AppColors.navy),
    const SizedBox(height: 8),
    Text(value, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: AppColors.navy)),
    const SizedBox(height: 5),
    Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
  ]);
}

class _BottomDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  const _BottomDetail({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) => Column(children: [
    Icon(icon, size: 24, color: AppColors.muted),
    const SizedBox(height: 7),
    Text(label, style: const TextStyle(fontSize: 11, color: AppColors.muted)),
  ]);
}
