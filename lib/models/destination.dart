class Destination {
  final String name;
  final String country;
  final String rating;
  final String image;
  final String duration;
  final String difficulty;
  final String bestTime;
  final String price;
  final String overview;
  final List<String> highlights;

  const Destination({
    required this.name,
    required this.country,
    required this.rating,
    required this.image,
    this.duration = '14 Days',
    this.difficulty = 'Moderate',
    this.bestTime = 'Mar - May',
    this.price = '\$650',
    this.overview =
        'Discover the beauty of the Himalayas through spectacular mountain scenery, local villages, beautiful trails, and unforgettable trekking experiences in Nepal.',
    this.highlights = const [
      'Beautiful Himalayan mountain views',
      'Traditional culture and villages',
      'Unforgettable trekking experience',
    ],
  });
}
