class Project {
  final String name;
  final String description;
  final List<String> images;
  final List<String> videos;
  final String link;
  Project({
    required this.name,
    required this.description,
    required this.images,
    required this.videos,
    required this.link,
  });
}

List<Project> projectList = [
  Project(
    name: 'Music Player App',
    description: 'A music player app developed using Flutter, allowing users to play audio files stored on their device. The app includes features like creating playlists, marking favorite songs, and playing music in the background. The app provides a smooth user experience with an intuitive and interactive design.',
    images: [
      'assets/images/coffee.png',
      'assets/images/coffee2.png', // Example additional image
    ],
    videos: [
      'assets/videos/music_demo.mp4', // Example video asset
    ],
    link: 'https://github.com/Eslam-Hossam1/music_player_application',
  ),
  Project(
    name: 'Notes App',
    description: 'A simple yet effective notes application developed with Flutter. The app allows users to create, edit, and delete notes, with the added functionality of choosing a color for each note. Notes are stored in a local database using Hive, ensuring fast and efficient data retrieval. The app provides a clean and intuitive interface for managing notes on the go.',
    images: [
      'assets/images/car.png',
    ],
    videos: [],
    link: 'https://github.com/Eslam-Hossam1/notes_app',
  ),
  Project(
    name: 'Bookly App',
    description: 'A book browsing application developed with Flutter that integrates with the Google Books API. The app allows users to search for books, view detailed previews, and explore various book categories. It provides a smooth and intuitive user experience with seamless integration of external data, offering real-time book information directly from Google Books.',
    images: ['assets/images/alarm.jpg'],
    videos: [],
    link: 'https://github.com/Eslam-Hossam1/bookly_app',
  ),
  Project(
    name: 'CUI Aider',
    description: 'CUI AIDER is an extraordinary application that brings together augmented reality (AR), a robust student portal, intuitive class management, and a comprehensive GPA system, providing an all-encompassing solution for students.Using AR technology, CUI AIDER offers an immersive experience, allowing users to explore the complete university campus virtually. Through AR, students can visualize buildings, navigate with interactive directions, and gain a better understanding of their surroundings.',
    images: ['assets/images/cui.png'],
    videos: [],
    link: 'https://github.com/Hamad-Anwar/',
  ),
  Project(
    name: 'Flutter Music Streaming Application',
    description: 'A Flutter music streaming application that allows users to play audio files from local storage. The app features a beautiful neumorphic UI design and provides a smooth user experience for browsing and playing music.',
    images: ['assets/images/player.png'],
    videos: [],
    link: 'https://github.com/Hamad-Anwar/Neumorphic-Music_Player-Flutter',
  ),
  Project(
    name: 'Food Recipe App',
    description: 'This repository contains a Flutter implementation of a Food Recipe app with a captivating introduction section and impressive animations. It also features a signup and signin page with animations, elegantly presented on a bottom sheet.',
    images: ['assets/images/recipe.png'],
    videos: [],
    link: 'https://github.com/Hamad-Anwar/Food-Recipe-App-Flutter',
  ),

];
