import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_memory/views/pages/home_page/widgets/bottom_bar/home_to_calendar_btn.dart';
import 'package:my_memory/views/pages/home_page/widgets/bottom_bar/home_to_profile_btn.dart';
import '../../../style/colors.dart';
import 'widgets/app_bar/home_app_bar.dart';
import 'widgets/body/home_body.dart';
import '../../common/home_to_post_btn.dart';

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
      backgroundColor: backgroundColor,
      appBar: HomeAppBar(),
      body: HomeBody(),

      floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: HomeToCalendarIconButton(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: HomeToPostButton(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: HomeToProfileButton(),
              ),
            ),
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
