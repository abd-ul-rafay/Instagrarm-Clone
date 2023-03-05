import 'package:flutter/material.dart';
import 'package:instagram_clone/views/screens/pages/home/post.dart';
import 'package:instagram_clone/views/screens/pages/home/status.dart';
import '../../../../utils/consts.dart';
import 'my_appbar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const MyAppBar(), // SliverAppBar
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Status(
                index: index,
                user: listOfUsers[index],
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
            childCount: 3,
            (context, index) => Post(
              post: listOfPosts[index],
            ),
          )
        ),
      ],
    );
  }
}
