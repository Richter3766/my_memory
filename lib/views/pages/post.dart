import 'package:flutter/material.dart';

import '../widgets/app_bar/post_app_bar.dart';
import '../widgets/post/post_body.dart';

class PostPage extends StatelessWidget{
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PostAppBar(),
      body: PostBody(),
      );
  }

}