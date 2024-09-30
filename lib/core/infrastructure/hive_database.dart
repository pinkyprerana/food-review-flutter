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
  static const String userEmail = 'email';
  static const String userPhone = 'phone';
  static const String userBio = 'bio';
  static const String userCity = 'city';
  static const String userFirstName = 'first_name';
  static const String userLastName = 'last_name';
  static const String userRoleId = '_id';
  static const String roleUsername = 'role';
  static const String userRoleName = 'roleDisplayName';
  static const String fullName = 'fullName';
  static const String influencerType = 'influencerType';
  static const String expertise = 'expertise';
  static const String about = 'about';
  static const String profileUrl = 'profileUrl';
  static const String profileImage = 'profile_image';
  static const String otp = 'otp';
  static const String otpExpireTime = 'otpExpireTime';
  static const String preference = 'preference';
  static const String socialAccount = 'socialAccount';
  static const String getStartedDone = 'getStartedDone';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String location = 'location';
  static const String isLocationFetched = 'isLocationFetched';
  static const String deviceToken = 'deviceToken';
}
