import 'package:flutter_portfolio/model/chefio_urls_helper.dart';
import 'package:flutter_portfolio/model/feature_model.dart';
import 'package:flutter_portfolio/model/project_model.dart';

List<Project> projectList = [
  const Project(
    name: 'Iron Pulse – Fitness App',
    description:
        'Iron Pulse is a fitness app built with Flutter during the CS Academy training program as part of a five-person team.\n\nThe app helps users discover training plans, explore trainer profiles, and manage their favorite workouts — all through a clean, modern UI.\n\nPersonally contributed the Home feature (training plans) and Favourites feature end-to-end, plus profile bug fixes.\n\nArchitected with MVVM, Bloc (Cubit) state management, GoRouter navigation, and Supabase as the backend.',
    images: [
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883780/splash_qtrwt3.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883780/onboarding_wab61n.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883780/login_czppbe.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883779/home_bgac65.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883779/home_liked_bbgdma.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883779/plans_neulel.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883779/plan_details_pmclmb.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883785/trainners_vaylcc.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883779/favourites_empty_nuy6nk.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883786/favourties_not_empty_esgv7f.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883785/profile_fzmlr1.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1781883785/edit_profile_ndlp59.jpg',
    ],
    videos: [
      'https://res.cloudinary.com/deshi2o56/video/upload/v1781797555/Screenrecorder-2026-05-01-17-37-30-580_ztu0et.mp4',
    ],
    featureModelsList: [
      FeatureModel(
        feature: 'Home & Training Plans',
        featurePoints: [
          'Browsed and displayed training plans with cover images, titles, and key details',
          'Implemented like functionality directly from the plans list with instant UI updates',
          'Built smooth navigation to plan details with full step-by-step breakdown',
        ],
      ),
      FeatureModel(
        feature: 'Plan Details',
        featurePoints: [
          'Displayed full plan info: name, description, duration, and trainer details',
          'Showed structured exercise steps for clear workout guidance',
          'Supported liking plans from the details screen with reactive state updates',
        ],
      ),
      FeatureModel(
        feature: 'Favourites',
        featurePoints: [
          'Implemented a dedicated Favourites feature to save and manage liked training plans',
          'Handled empty and populated states with distinct UI feedback',
          'Synced favourite state across Home and Favourites features seamlessly',
        ],
      ),
      FeatureModel(
        feature: 'Trainers',
        featurePoints: [
          'Displayed a list of available trainers with profile images and key info',
          'Provided smooth navigation to individual trainer profiles',
        ],
      ),
      FeatureModel(
        feature: 'Profile & Edit Profile',
        featurePoints: [
          'Showed user profile with stats and personal details',
          'Implemented edit profile functionality with form validation and Supabase sync',
          'Fixed profile-related bugs reported by teammates during development',
        ],
      ),
      FeatureModel(
        feature: 'Authentication',
        featurePoints: [
          'Implemented Login flow with secure Supabase authentication',
          'Handled session persistence and redirect logic using GoRouter',
        ],
      ),
      FeatureModel(
        feature: 'Onboarding',
        featurePoints: [
          'Designed a clean onboarding screen to introduce the app on first launch',
        ],
      ),
      FeatureModel(
        feature: 'Backend & Database (Supabase)',
        featurePoints: [
          'Created Supabase SQL tables: plans, plan_steps, trainers, and favourites',
          'Configured Row Level Security (RLS) policies for data access control',
          'Built Dart model classes and repository layer for clean data handling',
        ],
      ),
      FeatureModel(
        feature: 'MVVM Architecture & Bloc (Cubit) State Management',
        featurePoints: [
          'Applied MVVM architecture with Cubit for predictable and maintainable state management',
          'Used get_it for dependency injection across features',
          'Structured the project with clean feature separation and modular folders',
        ],
      ),
    ],
    link: 'https://github.com/Eslam-Hossam1/Iron-Pulse-Fitness-App',
    thumbnail: 'assets/images/iron pulse thumbnail.png',
  ),
  Project(
    name: 'Chefio – Recipe Sharing App',
    description:
        'Chefio is a Full-Featured  Recipe Sharing App.\nIt allows users to discover, upload, and share recipes with a beautifully crafted UI and smooth user experience.\n\nCore features include browsing and searching recipes, detailed recipe pages with step-by-step instructions, profile management with social interactions (follow/unfollow), and a secure authentication system with reusable OTP. \n\nThe app also supports push notifications, deep linking for shareable recipes and profiles, multi-language localization, light/dark theming with persistence\n\nArchitected with MVVM, Bloc (Cubit) state management, and clean modular structure.',
    images: ChefioUrlHelper.toBeUsedImages,
    videos: ChefioUrlHelper.toBeUsedVideos,
    featureModelsList: [
      const FeatureModel(
        feature: 'Home & Recipe Discovery',
        featurePoints: [
          'Browse all recipes or filter by category with infinite scrolling (pagination)',
          'Recipe Item showcasing image, name, duration, category, chef avatar, and like button',
          'Search integration from AppBar for quick access',
          'Optimized smooth scroll experience across large datasets',
        ],
      ),
      const FeatureModel(
        feature: 'Recipe Details',
        featurePoints: [
          'Large recipe image header with context-specific actions: Share, and (Edit/Delete for owner)',
          'Rich Infos: name, description, duration, chef details, likes count',
          'Interactive Like system with ability to view all likers',
          'Full ingredients list with clear formatting',
          'Step-by-step cooking instructions with optional images for better UX',
        ],
      ),
      const FeatureModel(
        feature: 'Upload & Edit Recipes',
        featurePoints: [
          'Multi-step recipe creation flow: add images, name, description, duration, and category',
          'Dedicated step/ingredients editor with delete, and update functionality',
          'Edit recipes with pre-filled data and image management (add/remove)',
          'Success dialog and clear feedback after submission',
        ],
      ),
      const FeatureModel(
        feature: 'Profiles & Social Features',
        featurePoints: [
          'Personal profile and other chefs’ profiles with separate state handling',
          'Stats dashboard: total recipes, followers, and following',
          'Follow/Unfollow system with instant UI updates',
          'Tabs for uploaded recipes and liked recipes',
          'Followers and following lists displayed in smooth bottom sheets',
        ],
      ),
      const FeatureModel(
        feature: 'Authentication & Session Management',
        featurePoints: [
          'Implemented Sign Up, Login, and Forgot Password flows',
          'Email-based OTP verification for sign-up and password reset',
          'Reusable OTP Feature built with Open/Closed Principle for easy extension',
          'Secure token handling and caching with flutter_secure_storage',
          'Robust refresh token & session management with API interceptor',
        ],
      ),
      const FeatureModel(
        feature: 'Push Notifications',
        featurePoints: [
          'Integrated Firebase Cloud Messaging for real-time notifications',
          'Notifications for: 💖 Someone Liked your recipe, ➕ Someone followed you, 🆕 A chef you follow uploaded a new recipe.',
          'Notification screen to view all received notifications',
        ],
      ),
      const FeatureModel(
        feature: 'Deep Linking & Sharing',
        featurePoints: [
          'Generated shareable links for recipes and profiles',
          'Supported deep linking to open links directly inside the app',
          'Integrated smoothly with GoRouter for seamless navigation',
        ],
      ),
      const FeatureModel(
        feature: 'Theming & Localization',
        featurePoints: [
          'Light and dark themes with persistence powered by HydratedCubit',
          'Multi-language support implemented using easy_localization',
          'Settings screen for theme and language switching',
          'Consistent theming and typography across modules',
        ],
      ),
      const FeatureModel(
        feature: 'Onboarding',
        featurePoints: [
          'Stylish one-screen onboarding with custom plate design illustration',
        ],
      ),
      const FeatureModel(
        feature: 'MVVM Architecture & Bloc (Cubit) State Management',
        featurePoints: [
          'MVVM architecture with Bloc (Cubit) for predictable state management',
          'Dependency Injection with get_it for decoupled and testable modules',
          'Scalable modular folder structure with clean feature separation',
        ],
      ),
      const FeatureModel(
        feature: 'Performance & UX Optimizations',
        featurePoints: [
          'Added pagination to all scrollable views for efficient data handling',
          'Reduced jank with image loading and caching using Cached Network Image',
          'Implemented skeleton loaders and smooth animations for better user experience',
        ],
      ),
    ],
    link: 'https://github.com/Eslam-Hossam1/Chefio-Recipe-Sharing-App',
    thumbnail: 'assets/images/chefio thumbnail.png',
  ),
  const Project(
    name: 'Vibes – Music Player App',
    description:
        'A music player app developed using Flutter, allowing users to play audio files stored on their device. The app includes features like creating playlists, marking favorite songs, and playing music in the background. The app provides a smooth user experience with an intuitive and interactive design.',
    images: [
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539193/1745538677557_xpru47.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539197/1745538677539_vjue2z.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539186/1745538677408_omgude.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539191/1745538677443_argsdj.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539198/1745538677518_y2mynz.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539197/1745539060215_gawptx.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539180/1745538677340_tqbnso.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539179/1745538677324_vgjaa8.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539184/1745538677307_b86kbe.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745539186/1745538677375_tgqdjj.jpg',
    ],
    videos: [
      'https://res.cloudinary.com/deshi2o56/video/upload/v1745537853/music_player_application_y3eu0e.mp4',
    ],
    featureModelsList: [
      FeatureModel(
        feature: 'Audio Controls',
        featurePoints: [
          'Developed custom controls for play, pause, skip, previous, and seek',
          'Displayed real-time track duration and playback position',
        ],
      ),
      FeatureModel(
        feature: 'Background Playback',
        featurePoints: [
          'Integrated background audio playback to ensure uninterrupted listening even when the app is minimized',
          'Used appropriate Flutter packages for audio service and lifecycle handling',
        ],
      ),
      FeatureModel(
        feature: 'Playlist Management (CRUD)',
        featurePoints: [
          'Implemented full Create, Read, Update, and Delete functionality for user playlists',
          'Enabled playlist renaming, reordering, and deletion with smooth animations',
        ],
      ),
      FeatureModel(
        feature: 'Favorites Musics',
        featurePoints: [
          'Added support for marking and unmarking songs as favorites',
          'Created a dedicated favorites section for easy access to preferred tracks',
        ],
      ),
      FeatureModel(
        feature: 'State Persistence',
        featurePoints: [
          'Saved and restored last played track after app restarts',
          'Used local storage for data persistence',
        ],
      ),
    ],
    link: 'https://github.com/Eslam-Hossam1/Vibes-Music-Player-App',
    thumbnail: 'assets/images/vibes player thumbnail.png',
  ),
  const Project(
    name: 'Bookly – Book Browsing App',
    description:
        'A book browsing application developed with Flutter that integrates with the Google Books API. The app allows users to search for books, view detailed previews. It provides a smooth and intuitive user experience with seamless integration of external data, offering real-time book information directly from Google Books.',
    images: [
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745588013/1745587020466_awvijs.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745588021/1745587020450_eguyqq.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745588019/1745587020432_qs5cuo.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745588014/1745587020414_hns203.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745588021/1745587020397_btcibk.jpg',
    ],
    videos: [
      'https://res.cloudinary.com/deshi2o56/video/upload/v1745588142/VID_20250425_161627_ba8vpi.mp4'
    ],
    featureModelsList: [
      FeatureModel(
        feature: 'Book Browsing',
        featurePoints: [
          'Fetched and displayed a collection of free Google Books with cover images and titles',
          'Used Dio for efficient HTTP requests and data handling from the Google Books API',
        ],
      ),
      FeatureModel(
        feature: 'Book Preview',
        featurePoints: [
          'Integrated free preview functionality allowing users to explore book content before downloading or buying',
          'Handled deep linking and redirection for seamless access to external preview links',
        ],
      ),
      FeatureModel(
        feature: 'Search Functionality',
        featurePoints: [
          'Implemented a real-time book search feature with keyword filtering',
          'Displayed relevant results dynamically while maintaining performance',
        ],
      ),
      FeatureModel(
        feature: 'Network Image Optimization',
        featurePoints: [
          'Used CachedNetworkImage to efficiently load and cache book covers',
          'Improved image loading performance and reduced data usage',
        ],
      ),
      FeatureModel(
        feature: 'State Management',
        featurePoints: [
          'Managed UI states using Cubit from the Flutter Bloc library',
          'Ensured consistent and reactive UI updates based on state changes',
        ],
      ),
      FeatureModel(
        feature: 'MVVM Architecture',
        featurePoints: [
          'Applied the MVVM architectural pattern for scalable and maintainable code structure',
          'Separated logic into well-defined layers: models, views, view models, and services',
        ],
      ),
      FeatureModel(
        feature: 'Project Structure & Code Quality',
        featurePoints: [
          'Maintained modular and clean code organization with separation of concerns',
          'Followed best practices for naming, file structuring, and reusable components',
        ],
      ),
      FeatureModel(
        feature: 'UI/UX Design',
        featurePoints: [
          'Designed a clean and modern interface focused on book discovery and readability',
          'Utilized CustomScrollView for a smooth and native scrolling experience with flexible layouts',
        ],
      ),
    ],
    link: 'https://github.com/Eslam-Hossam1/bookly_app',
    thumbnail: 'assets/images/bookly thumbnail.png',
  ),
  const Project(
    name: 'Calculator App',
    description:
        'A simple yet powerful calculator application built with Flutter. It supports basic arithmetic operations including addition, subtraction, multiplication, and division. The app offers both light and dark themes for better user comfort and leverages Cubit state management for clean logic separation.',
    images: [
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745593597/1745593363010_z6ad3y.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745593597/1745593362994_p88pyx.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745593597/1745593362953_szi8ux.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745593599/1745593362975_yvomle.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745593593/1745593362924_vbq1hl.jpg',
      'https://res.cloudinary.com/deshi2o56/image/upload/v1745593594/1745593362901_tg6ihr.jpg',
    ],
    videos: [
      'https://res.cloudinary.com/deshi2o56/video/upload/v1745593655/Screenrecorder-2025-04-25-18-00-54-403_tcpth0.mp4',
    ],
    featureModelsList: [
      FeatureModel(
        feature: 'Basic Arithmetic',
        featurePoints: [
          'Implemented addition, subtraction, multiplication, and division operations',
          'Handled edge cases like division by zero and large numbers',
        ],
      ),
      FeatureModel(
        feature: 'Dark and Light Mode',
        featurePoints: [
          'Added theme toggle support for light and dark mode',
          'Used ThemeData with Cubit to manage and persist theme state',
        ],
      ),
      FeatureModel(
        feature: 'State Management',
        featurePoints: [
          'Used Cubit to manage calculator logic and UI states cleanly',
          'Separated calculation logic from presentation layer',
        ],
      ),
      FeatureModel(
        feature: 'Code Quality & Structure',
        featurePoints: [
          'Organized project with clear separation between UI and logic',
          'Used clean architecture principles for maintainability and scalability',
        ],
      ),
    ],
    link: 'https://github.com/Eslam-Hossam1/calculator_app',
    thumbnail: 'assets/images/calcy thumbnail.png',
  ),
];
