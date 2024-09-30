import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../infrastructure/hive_database.dart';
import '../infrastructure/network_api_services.dart';

final hiveProvider = Provider(
      (ref) => HiveDatabase(),
);

//normal

final dioProvider = Provider((ref) => Dio());
final networkService = Provider((ref) =>
    NetworkApiService(ref.watch(dioProvider), ref.watch(hiveProvider)));

//shopify
final shopifyDioProvider = Provider<Dio>((ref) => Dio());
final shopifyNetworkService = Provider((ref) =>
    NetworkApiService(ref.watch(shopifyDioProvider), ref.watch(hiveProvider)));


final thumbnailFutureProvider = FutureProvider.autoDispose.family<Uint8List?, String>((ref, videoUrl) async {
  return await VideoThumbnail.thumbnailData(
    video: videoUrl.toLowerCase().toString(),
    imageFormat: ImageFormat.JPEG,
    maxWidth: 1280,
    quality: 25,
  );
});
