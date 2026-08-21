abstract class NextCartUrlHelper {
  static final NextCartUrlsLightMode _lightMode = NextCartUrlsLightMode();
  static final NextCartUrlsDarkMode _darkMode = NextCartUrlsDarkMode();

  static final List<String> toBeUsedImages = [
    ..._darkImagesToBeUsed,
    ..._lightImagesToBeUsed,
  ];

  static final List<String> toBeUsedVideos = [
    NextCartVideoUrls().demoVideo,
  ];

  static final List<String> _lightImagesToBeUsed = [
    _lightMode.onboarding1,
    _lightMode.onboarding2,
    _lightMode.onboarding3,
    _lightMode.logIn,
    _lightMode.signUp,
    _lightMode.homeUp,
    _lightMode.homeUp2,
    _lightMode.homeDown,
    _lightMode.fireSale,
    _lightMode.categories,
    _lightMode.brands,
    _lightMode.popularProducts,
    _lightMode.productDetails,
    _lightMode.favorites,
    _lightMode.cart,
    _lightMode.checkout,
    _lightMode.paymentCard,
    _lightMode.paymentMethods,
    _lightMode.paymentSuccessful,
    _lightMode.orders,
    _lightMode.orderDetails,
    _lightMode.profile,
    _lightMode.editProfile,
  ];

  static final List<String> _darkImagesToBeUsed = [
    _darkMode.splash,
    _darkMode.onboarding1,
    _darkMode.onboarding2,
    _darkMode.onboarding3,
    _darkMode.logIn,
    _darkMode.signUp,
    _darkMode.homeUp,
    _darkMode.homeUp2,
    _darkMode.homeDown,
    _darkMode.fireSale,
    _darkMode.categories,
    _darkMode.brands,
    _darkMode.popularProducts,
    _darkMode.productDetails,
    _darkMode.favorites,
    _darkMode.cart,
    _darkMode.checkout,
    _darkMode.paymentCard,
    _darkMode.paymentMethods,
    _darkMode.paymentSuccessful,
    _darkMode.orders,
    _darkMode.orderDetails,
    _darkMode.profile,
    _darkMode.editProfile,
  ];
}

abstract class NextCartBasicImages {
  String get onboarding1;
  String get onboarding2;
  String get onboarding3;

  String get logIn;
  String get signUp;

  String get homeUp;
  String get homeUp2;
  String get homeDown;
  String get fireSale;

  String get categories;
  String get brands;
  String get popularProducts;
  String get productDetails;
  String get favorites;

  String get cart;
  String get checkout;
  String get paymentCard;
  String get paymentMethods;
  String get paymentSuccessful;

  String get orders;
  String get orderDetails;

  String get profile;
  String get editProfile;
}

class NextCartVideoUrls {
  static const NextCartVideoUrls _instance = NextCartVideoUrls._();
  const NextCartVideoUrls._();
  factory NextCartVideoUrls() => _instance;

  final String demoVideo =
      'https://res.cloudinary.com/deshi2o56/video/upload/v1787354508/NextCart_Demo_bauxgv.mp4';
}

class NextCartUrlsLightMode implements NextCartBasicImages {
  static const NextCartUrlsLightMode _instance = NextCartUrlsLightMode._();
  const NextCartUrlsLightMode._();
  factory NextCartUrlsLightMode() => _instance;

  @override
  final String onboarding1 =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354424/onboarding_1_light_yezyib.jpg';
  @override
  final String onboarding2 =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354422/onboarding_2_light_pvlmfw.jpg';
  @override
  final String onboarding3 =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354427/onboarding_3_light_kjoa5z.jpg';

  @override
  final String logIn =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354420/login_light_oinrlp.jpg';
  @override
  final String signUp =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354433/sign_up_light_np4cg0.jpg';

  @override
  final String homeUp =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354420/home_up_light_qbs8fv.jpg';
  @override
  final String homeUp2 =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354420/home_up_light_2_irrgdr.jpg';
  @override
  final String homeDown =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354421/home_down_light_qepgdm.jpg';
  @override
  final String fireSale =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354420/fire_sale_light_dgbggi.jpg';

  @override
  final String categories =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354416/categories_light_drcyh0.jpg';
  @override
  final String brands =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354414/brands_light_mf307b.jpg';
  @override
  final String popularProducts =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354432/popular_products_light_sb9kej.jpg';
  @override
  final String productDetails =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354430/product_details_light_yb6alb.jpg';
  @override
  final String favorites =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354420/favorites_light_mjb9pn.jpg';

  @override
  final String cart =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354415/cart_light_nv4py6.jpg';
  @override
  final String checkout =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354416/checkout_light_gfjk8m.jpg';
  @override
  final String paymentCard =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354429/payment_card_light_rrfzed.jpg';
  @override
  final String paymentMethods =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354429/payment_methods_light_h4cbqa.jpg';
  @override
  final String paymentSuccessful =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354428/payment_successful_light_hiizif.jpg';

  @override
  final String orders =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354428/orders_light_xonkwl.jpg';
  @override
  final String orderDetails =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354424/order_details_light_cqbtpm.jpg';

  @override
  final String profile =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354431/profile_light_uppw5s.jpg';
  @override
  final String editProfile =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354417/edit_profile_light_i1xny3.jpg';

  List<String> get orderedImages => [
        onboarding1,
        onboarding2,
        onboarding3,
        logIn,
        signUp,
        homeUp,
        homeUp2,
        homeDown,
        fireSale,
        categories,
        brands,
        popularProducts,
        productDetails,
        favorites,
        cart,
        checkout,
        paymentCard,
        paymentMethods,
        paymentSuccessful,
        orders,
        orderDetails,
        profile,
        editProfile,
      ];
}

class NextCartUrlsDarkMode implements NextCartBasicImages {
  static const NextCartUrlsDarkMode _instance = NextCartUrlsDarkMode._();
  const NextCartUrlsDarkMode._();
  factory NextCartUrlsDarkMode() => _instance;

  final String splash =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354413/splash_dark_pc5aba.jpg';

  @override
  final String onboarding1 =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354402/onboarding_dark_1_eyo24z.jpg';
  @override
  final String onboarding2 =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354403/onboarding_dark_2_pkrpzt.jpg';
  @override
  final String onboarding3 =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354403/onboarding_dark_3_phhpes.jpg';

  @override
  final String logIn =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354401/login_dark_nm0cpw.jpg';
  @override
  final String signUp =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354413/sign_up_dark_m5xtpd.jpg';

  @override
  final String homeUp =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354404/home_dark_up_qqziml.jpg';
  @override
  final String homeUp2 =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354403/home_up_dark_2_nx4aia.jpg';
  @override
  final String homeDown =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354401/home_down_dark_x79b0u.jpg';
  @override
  final String fireSale =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354401/fire_sale_dark_wckxqz.jpg';

  @override
  final String categories =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354398/categories_dark_ioeeky.jpg';
  @override
  final String brands =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354397/brands_dark_jhkl3j.jpg';
  @override
  final String popularProducts =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354413/popular_products_dark_qeblxy.jpg';
  @override
  final String productDetails =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354413/product_details_dark_yklkik.jpg';
  @override
  final String favorites =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354399/favorites_darkd_dszweq.jpg';

  @override
  final String cart =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354398/cart_dark_phl3gm.jpg';
  @override
  final String checkout =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354398/checkout_dark_cejrsm.jpg';
  @override
  final String paymentCard =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354405/payment_card_dark_gywliy.jpg';
  @override
  final String paymentMethods =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354405/payment_mehtods_dark_s4thry.jpg';
  @override
  final String paymentSuccessful =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354412/payment_success_dark_ue2s5q.jpg';

  @override
  final String orders =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354404/orders_dark_ucd4lk.jpg';
  @override
  final String orderDetails =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354404/order_details_dark_y7hw1f.jpg';

  @override
  final String profile =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354414/profile_dark_nsy79x.jpg';
  @override
  final String editProfile =
      'https://res.cloudinary.com/deshi2o56/image/upload/v1787354398/edit_profile_dark_vj3lyk.jpg';

  List<String> get orderedImages => [
        splash,
        onboarding1,
        onboarding2,
        onboarding3,
        logIn,
        signUp,
        homeUp,
        homeUp2,
        homeDown,
        fireSale,
        categories,
        brands,
        popularProducts,
        productDetails,
        favorites,
        cart,
        checkout,
        paymentCard,
        paymentMethods,
        paymentSuccessful,
        orders,
        orderDetails,
        profile,
        editProfile,
      ];
}
