import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../widgets/app_bar/home_app_bar.dart';
import '../widgets/body/home_body.dart';
import '../widgets/bottom_bar/home_bottom_bar.dart';
import '../widgets/bottom_bar/button/home_to_post_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR')],
      routes: {
        '/home': (context) => const MainPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),

      bottomNavigationBar: HomeBottomAppBar(),

      floatingActionButton: HomeToPostButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
