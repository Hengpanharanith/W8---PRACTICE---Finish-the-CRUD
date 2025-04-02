import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8_crud/data/repository/firebase/songs_firebase_repository.dart';
import 'package:week8_crud/data/repository/song_repository.dart';
import 'package:week8_crud/firebase_options.dart';
import 'package:week8_crud/ui/provider/song_provider.dart';
import 'package:week8_crud/ui/screen/home_page.dart';

// 5 - MAIN
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 1 - Create repository
  final SongRepository songRepository = FirebaseSongRepository();
  // 2-  Run app
  runApp(
    ChangeNotifierProvider(
      create: (context) => SongProvider(songRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    ),
  );
}
