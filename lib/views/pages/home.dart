import 'package:flutter/material.dart';
import '../widgets/app_bar/home_app_bar.dart';
import '../widgets/post/post_list.dart';
import '../widgets/bottom_bar/bottom_bar.dart';
import '../widgets/bottom_bar/button/post_btn.dart';
import '../widgets/bottom_bar/bottom_bar_handler.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList()),
        ],
      ),

      bottomNavigationBar: CustomBottomAppBar(
        calendarBtnHandler: moveToCalendarPage,
        profileBtnHandler: moveToProfilePage
        ),

      floatingActionButton: CustomFloatingActionButton(
        postBtnHandler: moveToPostPage
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
