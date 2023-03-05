
import 'package:instagram_clone/models/user.dart';

class Post {
  final User user;
  final String postImageUrl;
  final int likes;
  final String caption;
  final String day;

  Post({required this.user, required this.postImageUrl, required this.likes, required this.caption, required this.day,});
}
