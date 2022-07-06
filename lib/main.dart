import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pinterest_app_clone/pages/details_page.dart';
import 'package:pinterest_app_clone/pages/main_pages/chat_pages/chat_page.dart';
import 'package:pinterest_app_clone/pages/main_pages/home_page.dart';
import 'package:pinterest_app_clone/pages/main_pages/profile_pages/account_settings.dart';
import 'package:pinterest_app_clone/pages/main_pages/profile_pages/profile_page.dart';
import 'package:pinterest_app_clone/pages/main_pages/search_page.dart';
import 'package:pinterest_app_clone/services/hive_service.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  await Hive.initFlutter();
  await Hive.openBox(HiveDB.DB_NAME);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HiveDB.box.listenable(),
        builder: (BuildContext context, box, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomePage(),
            routes: {
              HomePage.id: (context) => const HomePage(),
              SearchPage.id: (context) => const SearchPage(),
              ChatPage.id: (context) => const ChatPage(),
              ProfilePage.id: (context) => const ProfilePage(),
              AccountSettings.id: (context) => const AccountSettings(),
              DetailsPage.id: (context) => DetailsPage(),
            },
          );
        });
  }
}
