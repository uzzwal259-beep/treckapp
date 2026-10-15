import 'package:flutter/material.dart';
import '../data/destinations_data.dart';
import '../models/destination.dart';
import '../theme/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/category_item.dart';
import '../widgets/destination_card.dart';
import '../widgets/featured_trek_card.dart';
import '../widgets/recommended_trek_card.dart';
import 'profile_screen.dart';
import 'saved_screen.dart';
import 'trip_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  String searchText = '';

  void openTrip(Destination destination) {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => TripDetailsScreen(destination: destination),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final filtered = destinations.where((d) =>
      d.name.toLowerCase().contains(searchText.toLowerCase())).toList();

    final pages = [
      _buildExplorePage(filtered),
      _buildExplorePage(filtered),
      const SavedScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: SafeArea(child: IndexedStack(index: selectedTab, children: pages)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (index) => setState(() => selectedTab = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.darkGreen,
        unselectedItemColor: AppColors.muted,
        selectedLabelStyle: const TextStyle(fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildExplorePage(List<Destination> filtered) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
      children: [
        Row(children: [
          const Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good Morning,', style: TextStyle(fontSize: 17, color: AppColors.navy)),
              SizedBox(height: 3),
              Text('Pramod 👋', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: AppColors.navy)),
            ],
          )),
          IconButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No new notifications'))),
            icon: const Icon(Icons.notifications_none, size: 28),
          ),
        ]),
        const SizedBox(height: 22),
        TextField(
          onChanged: (value) => setState(() => searchText = value),
          decoration: InputDecoration(
            hintText: 'Search treks, destinations, or places...',
            hintStyle: const TextStyle(fontSize: 13, color: AppColors.muted),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: AppColors.pale,
            contentPadding: const EdgeInsets.symmetric(vertical: 17),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 20),
        FeaturedTrekCard(image: AppConstants.everestImage, onTap: () => openTrip(destinations[3])),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryItem(icon: Icons.terrain, title: 'Trekking', background: Color(0xFFE1F5EF)),
            CategoryItem(icon: Icons.map, title: 'Tours', background: Color(0xFFE0F0FF)),
            CategoryItem(icon: Icons.hotel, title: 'Hotels', background: Color(0xFFFFEEDB)),
            CategoryItem(icon: Icons.explore, title: 'Explore', background: Color(0xFFF0E4FF)),
          ],
        ),
        const SizedBox(height: 27),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Popular Destinations', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.navy)),
            TextButton(onPressed: () => setState(() => selectedTab = 1), child: const Text('See All')),
          ],
        ),
        const SizedBox(height: 8),
        if (filtered.isEmpty)
          const Padding(padding: EdgeInsets.all(20), child: Text('No destinations found. Try another search.'))
        else
          SizedBox(
            height: 195,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) => DestinationCard(
                destination: filtered[index],
                onTap: () => openTrip(filtered[index]),
              ),
            ),
          ),
        const SizedBox(height: 20),
        const Text('Recommended For You', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.navy)),
        const SizedBox(height: 12),
        ...filtered.map((d) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: RecommendedTrekCard(destination: d, onTap: () => openTrip(d)),
        )),
      ],
    );
  }
}
