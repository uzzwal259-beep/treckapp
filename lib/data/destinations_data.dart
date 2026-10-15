import '../models/destination.dart';
import '../utils/app_constants.dart';

const destinations = <Destination>[
  Destination(
    name: 'Annapurna Circuit',
    country: 'Nepal',
    rating: '4.8',
    image: AppConstants.annapurnaImage,
    overview:
        'The Annapurna Circuit is one of the most breathtaking trekking routes in the world, featuring diverse landscapes, traditional villages, and stunning mountain views.',
    highlights: [
      'Thorong La Pass (5,416 m)',
      'Tibetan culture and villages',
      'Stunning views of Annapurna range',
    ],
  ),
  Destination(
    name: 'Langtang Valley',
    country: 'Nepal',
    rating: '4.6',
    image: AppConstants.langtangImage,
    duration: '8 Days',
    price: '\$420',
  ),
  Destination(
    name: 'Mardi Himal Trek',
    country: 'Nepal',
    rating: '4.7',
    image: AppConstants.mardiImage,
    duration: '5 Days',
    price: '\$350',
  ),
  Destination(
    name: 'Everest Base Camp',
    country: 'Nepal',
    rating: '4.9',
    image: AppConstants.everestImage,
    duration: '12 Days',
    price: '\$1,250',
    difficulty: 'Challenging',
  ),
];
