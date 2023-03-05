import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post.dart' as model;

class Post extends StatelessWidget {
  final model.Post post;
  const Post({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 17.5,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(post.user.imageUrl, ),
                  ),
                  const SizedBox(width: 7.5,),
                  Text(post.user.name),
                ],
              ),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(post.postImageUrl),
                fit: BoxFit.cover,
              )
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite, color: Colors.red,),
                  SizedBox(width: 10.0,),
                  Icon(Icons.messenger_outline_rounded),
                  SizedBox(width: 10.0,),
                  Icon(Icons.send),
                ],
              ),
              const Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.likes.toString()),
              Text('${post.user.name}: ${post.caption}'),
              const Text('view all comments'),
              Text(post.day),
            ],
          ),
        ),
        const SizedBox(height: 5.0,),
      ],
    );
  }
}
