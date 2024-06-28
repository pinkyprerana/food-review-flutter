import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';

final dioProvider = Provider((ref) => Dio());
final hiveProvider = Provider(
  (ref) => HiveDatabase(),
);

// final placesProvider =
//     Provider((ref) => GoogleMapsPlaces(apiKey: kGoogleApiKey));

// final locationUriProvider = Provider.family(
//   (ref, String query) {
//     Uri uri =
//         Uri.https('maps.googleapis.com', 'maps/api/place/autocomplete/json', {
//       "input": query, // query parameter

//       "key": kGoogleApiKey,
//     });
//     return uri;
//   },
// );

// final thumbnailFutureProvider =
//     FutureProvider.autoDispose.family<Uint8List?, String>((ref, videoUrl) {
//   return VideoThumbnail.thumbnailData(
//     video: videoUrl,
//     imageFormat: ImageFormat.JPEG,
//     maxWidth: 1280,
//     quality: 25,
//   );
//   // return a Future<Item>
// });
