import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatabase {
  late Box<dynamic> _instance;

  Box<dynamic> get box => _instance;

  bool _hasBeenInitialized = false;

  Future<void> init() async {
    if (_hasBeenInitialized) return;

    _hasBeenInitialized = true;

    final dbDirectory = await getApplicationDocumentsDirectory();
    Hive.init(dbDirectory.path);

    _instance = await Hive.openBox<String>('Database');
  }
}

class AppPreferenceKeys {
  static const String token = 'token';
  static const String userId = 'userId';
  static const String userName = 'userName';
  static const String userEmail = 'userEmail';
  // static const String userRoleId = 'userRoleId';
  // static const String socialPlatform = 'socialPlatform';
  // static const String socialReach = 'socialReach';
  // static const String socialEngagement = 'socialEngagement';
  // static const String fullName = 'fullName';
  // static const String age = 'age';
  // static const String influencerType = 'influencerType';
  // static const String expertise = 'expertise';
  // static const String about = 'about';
  // static const String profileUrl = 'profileUrl';
  // static const String countryCode = 'countryCode';
}
