abstract class ChefioUrlHelper {
  static final ChefioUrlsLightMode _lightMode = ChefioUrlsLightMode();
  static final ChefioUrlsDarkMode _darkMode = ChefioUrlsDarkMode();
  static final ChefioVideoUrls _chefioVideo = ChefioVideoUrls();

  static final ChefioUrlsPushNotifications _pushNotifications =
      ChefioUrlsPushNotifications();
  static final List<String> toBeUsedImages = [
    ..._lightImagesToBeUsed,
    ..._pushNotificationImages,
    ..._darkImagesToBeUsed,
  ];
  static final List<String> toBeUsedVideos = [
    _chefioVideo.generalVideo,
    _chefioVideo.pushNotificationsVideo,
  ];
  static final List<String> _lightImagesToBeUsed = [
    _lightMode.onboarding,
    _lightMode.logIn,
    _lightMode.home,
    _lightMode.search,
    _lightMode.recipeDetailsUpper,
    _lightMode.recipeDetialsLittleMid,
    _lightMode.recipeDetailsIngredentsWithStep,
    _lightMode.recipeDetailsSteps,
    _lightMode.stepDialog,
    _lightMode.profile,
    _lightMode.profileLiked,
    _lightMode.profileImage,
    _lightMode.followersBottomSheet,
    _lightMode.notifications,
    _lightMode.uploadFirstStep,
    _lightMode.uploadSecondStep,
    _lightMode.editStepDialog,
    _lightMode.uploadSuccessDialog,
    _lightMode.editProfile,
    _lightMode.settings,
    _lightMode.themeSelection,
    _lightMode.languageSelection,
    _lightMode.signUp,
    _lightMode.otp,
    _lightMode.forgot,
    _lightMode.resetPassword,
  ];
  static final List<String> _darkImagesToBeUsed = [
    _darkMode.onboarding,
    _darkMode.logIn,
    _darkMode.home,
    _darkMode.search,
    _darkMode.recipeDetailsUpper,
    _darkMode.recipeDetialsLittleMid,
    _darkMode.recipeDetailsIngredentsWithStep,
    _darkMode.recipeDetailsSteps,
    _darkMode.stepDialog,
    _darkMode.profile,
    _darkMode.profileLiked,
    _darkMode.profileImage,
    _darkMode.followersBottomSheet,
    _darkMode.notifications,
    _darkMode.uploadFirstStep,
    _darkMode.uploadSecondStep,
    _darkMode.editStepDialog,
    _darkMode.uploadSuccessDialog,
    _darkMode.editProfile,
    _darkMode.settings,
    _darkMode.themeSelection,
    _darkMode.languageSelection,
    _darkMode.signUp,
    _darkMode.otp,
    _darkMode.forgot,
    _darkMode.resetPassword,
  ];

  static final List<String> _pushNotificationImages = [
    _pushNotifications.fullNotification,
    _pushNotifications.popupNotification,
  ];
}

abstract class ChefioBasicImages {
  String get onboarding;
  String get resetPassword;
  String get forgot;
  String get signUp;
  String get logIn;
  String get otp;

  String get home;
  String get search;

  String get uploadFirstStep;
  String get uploadFirstStepBottom;
  String get uploadSecondStep;
  String get uploadSecondStepBottom;
  String get uploadSuccessDialog;

  String get recipeDetailsUpper;
  String get recipeDetialsLittleMid;
  String get recipeDetailsIngredentsWithStep;
  String get recipeDetailsSteps;

  String get profile;
  String get profileLiked;
  String get profileImage;
  String get followersBottomSheet;
  String get editProfile;

  String get editStepDialog;
  String get notifications;
  String get settings;
  String get themeSelection;
  String get languageSelection;
  String get stepDialog;
}

class ChefioUrlsPushNotifications {
  static const ChefioUrlsPushNotifications _instance =
      ChefioUrlsPushNotifications._();
  const ChefioUrlsPushNotifications._();
  factory ChefioUrlsPushNotifications() => _instance;

  final String fullNotification =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849903/Screenshot_1758835096_fa0s6l.png';
  final String popupNotification =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849906/Screenshot_1758835057_pxko4f.png';
}

class ChefioVideoUrls {
  static const ChefioVideoUrls _instance = ChefioVideoUrls._();
  const ChefioVideoUrls._();
  factory ChefioVideoUrls() => _instance;

  final String pushNotificationsVideo =
      'https://res.cloudinary.com/deshi2o56/video/upload/v1758855634/2025-09-25_23-56-24_qdoqjy.mp4';
  final String generalVideo =
      'https://res.cloudinary.com/deshi2o56/video/upload/v1758855583/Screenrecorder-2025-09-25-05-17-43-258_1_swrbau.mp4';
}

class ChefioUrlsLightMode implements ChefioBasicImages {
  static const ChefioUrlsLightMode _instance = ChefioUrlsLightMode._();
  const ChefioUrlsLightMode._();
  factory ChefioUrlsLightMode() => _instance;

  @override
  final String onboarding =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1757058469/Screenshot_1749703206_botarb.png';
  @override
  final String resetPassword =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1757058457/Screenshot_1749707798_qgc2pn.png';
  @override
  final String forgot =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1757058457/Screenshot_1749707182_p5adw1.png';
  @override
  final String signUp =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1757058457/Screenshot_1749704247_gfelky.png';
  @override
  final String logIn =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1757058456/Screenshot_1749706470_yqpku4.png';
  @override
  final String otp =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758847039/Screenshot_2025-09-21-19-34-10-701_com.example.chefio_app_ong5pk.jpg';

  @override
  final String home =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758847192/Screenshot_2025-09-21-22-26-59-231_com.example.chefio_app_bkde9a.jpg';
  @override
  final String search =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758847417/Screenshot_2025-09-21-04-38-56-714_com.example.chefio_app_toovrt.jpg';

  @override
  final String uploadFirstStep =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758847635/Screenshot_2025-09-21-21-54-20-181_com.example.chefio_app_wcwqdr.jpg';
  @override
  final String uploadFirstStepBottom =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848181/Screenshot_2025-09-21-21-54-21-950_com.example.chefio_app_mhvukl.jpg';
  @override
  final String uploadSecondStep =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848232/Screenshot_2025-09-21-21-54-39-367_com.example.chefio_app_ydwzah.jpg';
  @override
  final String uploadSecondStepBottom =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848224/Screenshot_2025-09-21-21-54-40-740_com.example.chefio_app_upyrch.jpg';
  @override
  final String uploadSuccessDialog =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848269/Screenshot_2025-09-21-04-40-57-815_com.example.chefio_app_wqcwro.jpg';

  @override
  final String recipeDetailsUpper =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848527/Screenshot_2025-09-21-04-37-18-114_com.example.chefio_app_phkwav.jpg';
  @override
  final String recipeDetialsLittleMid =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848525/Screenshot_2025-09-21-04-37-32-744_com.example.chefio_app_ewdr9d.jpg';

  @override
  final String recipeDetailsIngredentsWithStep =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848583/Screenshot_2025-09-21-04-37-41-410_com.example.chefio_app_q4exc9.jpg';
  @override
  final String recipeDetailsSteps =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848587/Screenshot_2025-09-21-04-37-44-534_com.example.chefio_app_qi41l9.jpg';

  @override
  final String profile =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848401/Screenshot_2025-09-21-21-51-54-523_com.example.chefio_app_fz0shb.jpg';
  @override
  final String profileLiked =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848405/Screenshot_2025-09-21-21-52-20-712_com.example.chefio_app_clrl6h.jpg';
  @override
  final String profileImage =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848401/Screenshot_2025-09-21-04-38-06-868_com.example.chefio_app_s6gkkd.jpg';
  @override
  final String followersBottomSheet =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848485/Screenshot_2025-09-21-04-38-18-448_com.example.chefio_app_pzctzl.jpg';
  @override
  final String editProfile =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848688/Screenshot_2025-09-21-04-39-12-539_com.example.chefio_app_vz74gl.jpg';

  @override
  final String editStepDialog =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852943/Screenshot_2025-09-26-05-04-21-536_com.example.chefio_app_vgvoqo.jpg';
  @override
  final String notifications =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848622/Screenshot_2025-09-26-03-00-01-921_com.example.chefio_app_teu89u.jpg';
  @override
  final String settings =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848603/Screenshot_2025-09-21-21-55-00-873_com.example.chefio_app_z1lcgz.jpg';
  @override
  final String themeSelection =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848610/Screenshot_2025-09-21-21-55-09-722_com.example.chefio_app_g1xnws.jpg';
  @override
  final String languageSelection =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848601/Screenshot_2025-09-21-04-35-05-695_com.example.chefio_app_kzvp7u.jpg';
  @override
  final String stepDialog =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758848524/Screenshot_2025-09-21-04-37-47-441_com.example.chefio_app_bdpqsk.jpg';

  List<String> get orderedImages => [
        onboarding,
        signUp,
        logIn,
        forgot,
        resetPassword,
        otp,
        home,
        search,
        uploadFirstStep,
        uploadFirstStepBottom,
        uploadSecondStep,
        uploadSecondStepBottom,
        uploadSuccessDialog,
        recipeDetailsUpper,
        recipeDetialsLittleMid,
        recipeDetailsIngredentsWithStep,
        recipeDetailsSteps,
        profile,
        profileImage,
        profileLiked,
        followersBottomSheet,
        editProfile,
        editStepDialog,
        notifications,
        settings,
        themeSelection,
        languageSelection,
      ];
}

class ChefioUrlsDarkMode implements ChefioBasicImages {
  static const ChefioUrlsDarkMode _instance = ChefioUrlsDarkMode._();
  const ChefioUrlsDarkMode._();
  factory ChefioUrlsDarkMode() => _instance;

  @override
  final String onboarding =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849058/Screenshot_2025-09-16-01-41-27-912_com.example.chefio_app_lwrwpe.jpg';
  @override
  final String resetPassword =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758859133/Screenshot_2025-09-21-22-25-37-039_com.example.chefio_app_k2ggp7.jpg';
  @override
  final String forgot =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849051/Screenshot_2025-09-19-23-04-26-656_com.example.chefio_app_w0boi0.jpg';
  @override
  final String signUp =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849059/Screenshot_2025-09-16-01-41-30-919_com.example.chefio_app_kkcwta.jpg';
  @override
  final String logIn =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849050/Screenshot_2025-09-16-01-41-35-552_com.example.chefio_app_-_Copy_uzb1pd.jpg';
  @override
  final String otp =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849052/Screenshot_2025-09-19-23-06-04-185_com.example.chefio_app_jgiek7.jpg';

  @override
  final String home =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849167/Screenshot_2025-09-20-02-04-40-671_com.example.chefio_app_rnmrqi.jpg';
  @override
  final String search =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849213/Screenshot_2025-09-16-01-48-45-356_com.example.chefio_app_dj0qyf.jpg';

  @override
  final String uploadFirstStep =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852853/Screenshot_2025-09-26-04-37-37-543_com.example.chefio_app_gxbdue.jpg';
  @override
  final String uploadFirstStepBottom =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852885/Screenshot_2025-09-26-04-37-41-288_com.example.chefio_app_d9if4m.jpg';
  @override
  final String uploadSecondStep =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852912/Screenshot_2025-09-26-05-05-26-521_com.example.chefio_app_ixgdon.jpg';
  @override
  final String uploadSecondStepBottom =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852917/Screenshot_2025-09-26-05-05-28-016_com.example.chefio_app_lyj0lm.jpg';
  @override
  final String uploadSuccessDialog =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852934/Screenshot_2025-09-21-04-44-33-374_com.example.chefio_app_lpa2wp.jpg';
  @override
  final String stepDialog =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849675/Screenshot_2025-09-19-23-18-33-063_com.example.chefio_app_wb26ru.jpg';

  @override
  final String recipeDetailsUpper =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849625/Screenshot_2025-09-19-23-14-56-915_com.example.chefio_app_dwcmdf.jpg';
  @override
  final String recipeDetialsLittleMid =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849670/Screenshot_2025-09-19-23-15-39-442_com.example.chefio_app_eha2fn.jpg';
  @override
  @override
  final String recipeDetailsIngredentsWithStep =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849668/Screenshot_2025-09-19-23-15-33-909_com.example.chefio_app_o75kju.jpg';
  @override
  final String recipeDetailsSteps =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849630/Screenshot_2025-09-19-23-15-29-593_com.example.chefio_app_w1hikx.jpg';

  @override
  final String profile =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852922/Screenshot_2025-09-26-05-09-59-787_com.example.chefio_app_fvesq0.jpg';
  @override
  final String profileLiked =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852925/Screenshot_2025-09-26-05-10-03-130_com.example.chefio_app_nllmfm.jpg';
  @override
  final String profileImage =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852851/Screenshot_2025-09-26-05-10-06-001_com.example.chefio_app_uwypue.jpg';
  @override
  final String followersBottomSheet =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849519/Screenshot_2025-09-21-04-42-55-958_com.example.chefio_app_adx36d.jpg';
  @override
  final String editProfile =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852909/Screenshot_2025-09-26-04-59-40-146_com.example.chefio_app_ylzfi5.jpg';

  @override
  final String editStepDialog =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758852896/Screenshot_2025-09-26-04-54-11-645_com.example.chefio_app_wq8zvm.jpg';
  @override
  final String notifications =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849822/Screenshot_2025-09-26-03-01-31-158_com.example.chefio_app_sijl3u.jpg';
  @override
  final String settings =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849812/Screenshot_2025-09-21-21-55-14-540_com.example.chefio_app_yyelok.jpg';
  @override
  final String themeSelection =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849803/Screenshot_2025-09-21-21-55-11-592_com.example.chefio_app_whe8ax.jpg';
  @override
  final String languageSelection =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1758849710/Screenshot_2025-09-16-01-43-14-376_com.example.chefio_app_rz4ecd.jpg';

  List<String> get orderedImages => [
        onboarding,
        signUp,
        logIn,
        forgot,
        resetPassword,
        otp,
        home,
        search,
        uploadFirstStep,
        uploadFirstStepBottom,
        uploadSecondStep,
        uploadSecondStepBottom,
        uploadSuccessDialog,
        recipeDetailsUpper,
        recipeDetialsLittleMid,
        recipeDetailsIngredentsWithStep,
        recipeDetailsSteps,
        profile,
        profileImage,
        profileLiked,
        followersBottomSheet,
        editProfile,
        editStepDialog,
        notifications,
        settings,
        themeSelection,
        languageSelection,
      ];
}
