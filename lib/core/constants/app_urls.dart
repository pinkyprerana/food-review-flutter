class AppUrls {
  static const baseUrl = 'https://forthetable.dedicateddevelopers.us/api';
  static const postImageLocation =
      'https://forthetable.dedicateddevelopers.us/uploads/post/';

  //Authentication
  static const signup = '/user/signup';
  static const signin = '/user/signin';
  static const sendOTP = '/user/forgot-password';
  static const resendOTP = '/user/resend-forgot-password-otp';
  static const verifyOTP = '/user/forget-password-otp-verification';
  static const resetPassword = '/user/forget-password-change-password';
  static const addPost = '/post/add';
  static const followUnfollow = '/user/follow';
  static const getAllPreference = '/preference/list';
  static const getAllFollowers = '/user/follower/list';
  static const getAllFollowing = '/user/follow/list';
  static const profile = '/user/profile';
  static const profileUpdate = '/user/profile-update';
  static const logout = '/user/logout';
  static const profilePicLocation =
      'https://forthetable.dedicateddevelopers.us/uploads/user/profile_pic';


  //Post Feed
  static const getPostFeed = '/post/list';
  static const likeUnlikePost = '/post-like/add';
  static const swipeToLikeDislikePost = '/post-like/swapped';
  static const saveUnsavePost = '/post-save/add';
  static const addComment = '/post-comment/add';
  static const likeUnlikeComment = '/post-like/comment';

  //Other User's
  static const getOtherUserDetails = '/user/other/profile';

  //Notification
  static const getAllNotifications = '/notification/list';

  // Profile
  static const updatePassword = '/user/change-password';
  static const contact = '/contactUs/submit';
  static const userActivities = '/user/activity/list';
  static const acceptOrRejectRequest = '/user/follow/status/update';
  static const deleteAccount = '/user/delete';
  static const deactivateAccount = '/user/deactivate';
  static const savedPostList = '/post-save/list';

  // Leaderboard
  static const getLeaderboardList = '/user/leaderboard/list';

  // Pic Locations
  static const bannerLocation =
      'https://forthetable.dedicateddevelopers.us/uploads/user/banner';

  // Restaurant
  static const postListPerRestaurant = '/post/list';

  //restaurant
  static const restaurantList = '/restaurant/list';
  static const saveRestaurant = '/restaurant/save';
  static const restaurnatDetails = '/restaurant/details';
  static const getSavedRestaurantList = '/restaurant/save/list';
  static const reviewSubmit = '/restaurant/review/add';
}
