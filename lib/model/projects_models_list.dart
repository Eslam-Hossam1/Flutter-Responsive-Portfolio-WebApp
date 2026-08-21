import 'package:flutter_portfolio/model/chefio_urls_helper.dart';
import 'package:flutter_portfolio/model/feature_model.dart';
import 'package:flutter_portfolio/model/nextcart_urls_helper.dart';
import 'package:flutter_portfolio/model/project_model.dart';

List<Project> projectList = [
  Project(
    name: 'NextCart – Production E-Commerce Platform',
    description:
        'NextCart is a production-oriented E-Commerce mobile application built with Flutter, designed around a scalable architecture and a real-world commerce workflow.\n\n'
        'The application delivers a complete shopping experience — from onboarding and authentication to product discovery, personalized browsing, cart management, checkout, real payment processing, and order tracking.\n\n'
        'The application is powered by Supabase and PostgreSQL, providing authentication, database services, Row Level Security, and server-side business logic through Edge Functions.\n\n'
        'Payments are integrated with Stripe using PaymentIntents and Stripe Customer management. Payment confirmation is handled through server-side Stripe Webhooks rather than relying on the mobile client, ensuring order state remains reliable even if the application is closed or interrupted during payment.\n\n'
        'The project follows Clean Architecture with feature-based modularization, Bloc/Cubit state management, dependency injection, explicit failure handling, and a clear separation between presentation, domain, and data layers.\n\n'
        'Beyond its feature set, NextCart was engineered with production concerns in mind — including secure server-side price calculation, RLS-protected user data, webhook-driven order state synchronization, payment idempotency considerations, persistent user sessions, and a responsive light/dark themed experience.',
    images: NextCartUrlHelper.toBeUsedImages,
    videos: NextCartUrlHelper.toBeUsedVideos,
    featureModelsList: [
      const FeatureModel(
        feature: '🚀 Onboarding & First Experience',
        featurePoints: [
          'Three-screen animated onboarding experience introducing the platform and its core capabilities',
          'Smooth page transitions with skip and get-started actions',
          'Designed to provide a polished first-touch experience before authentication',
        ],
      ),
      const FeatureModel(
        feature: '🔐 Authentication & Session Management',
        featurePoints: [
          'Complete Sign Up and Login flows with client-side form validation',
          'Supabase Auth integration for secure user authentication and session management',
          'Persistent authentication state across application launches',
          'Automatic token refresh handling for seamless background re-authentication',
        ],
      ),
      const FeatureModel(
        feature: '🏠 Home & Product Discovery',
        featurePoints: [
          'Dynamic home experience with promotional banners, flash-sale campaigns, and curated product sections',
          'Horizontal product discovery sections optimized for fast browsing',
          'Popular and featured products surfaced directly from the backend',
          'Supabase-powered data fetching with caching for a smoother browsing experience',
        ],
      ),
      const FeatureModel(
        feature: '🔎 Search, Categories & Brands',
        featurePoints: [
          'Structured product discovery through categories and brands',
          'Search functionality for quickly finding products',
          'Dedicated browsing experiences for categories and brands',
          'Filter and discovery flows designed around real e-commerce navigation patterns',
        ],
      ),
      const FeatureModel(
        feature: '🛍️ Product Details',
        featurePoints: [
          'Rich product details experience with image galleries, descriptions, pricing, ratings, and stock information',
          'Product-specific actions including Add to Cart and Add to Favorites',
          'Responsive product presentation across different content states',
        ],
      ),
      const FeatureModel(
        feature: '❤️ Favorites & Personalization',
        featurePoints: [
          'Persistent favorites system synchronized with Supabase',
          'Reactive UI updates when products are added or removed from favorites',
          'Favorites remain available across sessions and devices for authenticated users',
        ],
      ),
      const FeatureModel(
        feature: '🛒 Cart Management',
        featurePoints: [
          'Persistent server-backed shopping cart',
          'Quantity management, item removal, subtotal calculation, and cart synchronization',
          'Cart state remains associated with the authenticated user',
          'Checkout operates on server-validated cart data rather than trusting client-calculated prices',
        ],
      ),
      const FeatureModel(
        feature: '💳 Production-Oriented Stripe Checkout',
        featurePoints: [
          'Real Stripe payment integration using the Stripe Flutter SDK',
          'Native Stripe Payment Sheet experience for secure payment collection',
          'PaymentIntent creation performed server-side through Supabase Edge Functions',
          'Server-side cart and price calculation to prevent client-side price manipulation',
          'Stripe Customer management allowing returning customers to reuse their saved payment methods where supported',
          'Support for multiple Stripe-supported payment methods through the Payment Sheet',
        ],
      ),
      const FeatureModel(
        feature: '🔄 Stripe Webhooks & Payment Reliability',
        featurePoints: [
          'Dedicated Supabase Edge Function receiving Stripe webhook events',
          'Cryptographic Stripe webhook signature verification before processing events',
          'Payment state is determined server-side rather than trusting the Flutter client',
          'Handles successful, failed, cancelled, and refunded payment events',
          'Webhook-driven order updates remain reliable even when the mobile application is closed',
          'Webhook idempotency prevents the same Stripe event from being processed multiple times',
        ],
      ),
      const FeatureModel(
        feature: '📦 Orders & Order Lifecycle',
        featurePoints: [
          'Complete order creation and persistence workflow tied to authenticated users',
          'Order history containing both active and previously completed purchases',
          'Detailed order view with itemized products, quantities, pricing, shipping, and totals',
          'Order lifecycle represented through meaningful states such as pending payment, paid, processing, shipped, delivered, cancelled, and refunded',
          'Order status synchronized from authoritative payment events received through Stripe Webhooks',
        ],
      ),
      const FeatureModel(
        feature: '⚡ Server-Side Business Logic',
        featurePoints: [
          'Supabase Edge Functions handle sensitive checkout and payment operations',
          'Client never determines the authoritative order total',
          'Backend validates the authenticated user before initiating checkout',
          'Payment and order operations are separated from the Flutter application lifecycle',
          'Sensitive Stripe operations remain isolated from the mobile client',
        ],
      ),
      const FeatureModel(
        feature: '🗄️ Supabase & PostgreSQL',
        featurePoints: [
          'Supabase PostgreSQL used as the primary application database',
          'Supabase Auth for identity and session management',
          'Row Level Security policies protecting user-owned resources',
          'Dedicated relational models for products, cart, favorites, orders, order items, payments, and Stripe customers',
          'Database indexing and structured queries designed for efficient data access',
        ],
      ),
      const FeatureModel(
        feature: '🛡️ Security & Data Integrity',
        featurePoints: [
          'Row Level Security prevents users from accessing other users\' data',
          'Stripe webhook signature verification protects the payment event pipeline',
          'Sensitive server-side operations are executed through Supabase Edge Functions',
          'Payment confirmation is based on Stripe server events rather than client-side success callbacks',
          'Order items are snapshot-based to preserve the purchased product information at checkout time',
        ],
      ),
      const FeatureModel(
        feature: '👤 Profile & Account Management',
        featurePoints: [
          'Personalized user profile experience',
          'Edit profile functionality with validation and Supabase synchronization',
          'Centralized access to order history and account preferences',
          'Persistent account state across application sessions',
        ],
      ),
      const FeatureModel(
        feature: '🌗 Light & Dark Theming',
        featurePoints: [
          'Complete light and dark theme system',
          'Consistent design tokens across the application',
          'System theme support alongside user-controlled theme preferences',
          'Theme preference persisted across application sessions',
        ],
      ),
      const FeatureModel(
        feature: '🏗️ Clean Architecture',
        featurePoints: [
          'Feature-first modular project structure',
          'Clear separation between Presentation, Domain, and Data layers',
          'Domain-driven entities, repositories, use cases, and parameters',
          'Repository abstraction isolates business logic from external data sources',
          'Designed to remain maintainable and extensible as the application grows',
        ],
      ),
      const FeatureModel(
        feature: '⚙️ Bloc / Cubit State Management',
        featurePoints: [
          'Bloc/Cubit used for predictable and reactive state management',
          'Dedicated Cubits for authentication, cart, checkout, orders, favorites, and other feature flows',
          'Explicit loading, success, and failure states',
          'Business logic kept outside UI components',
        ],
      ),
      const FeatureModel(
        feature: '🧩 Dependency Injection & Error Handling',
        featurePoints: [
          'GetIt used for dependency injection and service registration',
          'Decoupled dependencies across repositories, data sources, services, and Cubits',
          'Either<Failure, T> pattern for explicit and predictable error propagation',
          'Centralized failure handling for consistent application behavior',
        ],
      ),
    ],
    link: 'https://github.com/Eslam-Hossam1/NextCart',
    thumbnail:
        'https://res.cloudinary.com/deshi2o56/image/upload/v1787354435/NextCart_banner_hdaqsk.jpg',
  ),
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
    thumbnail:
        'https://res.cloudinary.com/deshi2o56/image/upload/q_100/v1782007169/iron_pulse_thumbnail_bvm2hc.png',
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
    thumbnail:
        'https://res.cloudinary.com/deshi2o56/image/upload/q_100/v1782007174/chefio_thumbnail_nz39o2.png',
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
    thumbnail:
        'https://res.cloudinary.com/deshi2o56/image/upload/q_100/v1782007169/vibes_player_thumbnail_lvw8sr.png',
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
    thumbnail:
        'https://res.cloudinary.com/deshi2o56/image/upload/q_100/v1782007168/bookly_thumbnail_sz2atm.png',
  ),
  const Project(
    name: 'Calcy – Calculator App',
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
    thumbnail:
        'https://res.cloudinary.com/deshi2o56/image/upload/q_100/v1782007171/calcy_thumbnail_soqkty.png',
  ),
];
