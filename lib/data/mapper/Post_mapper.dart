import 'package:sbornik_pervokursnika/data/api/model/api_Post.dart';
import 'package:sbornik_pervokursnika/domain/modle/post.dart';

Post postfromApi(ApiPost post)
  {
    return Post(
      title: post.title,
      text: post.text,
      image: post.image,
      time: post.timeofcreation,
    );
}

class PostMapper
{
  static List<Post> fromApi(ApiPostList posts)
  {
    return posts.posts.map((p) => postfromApi(p)).toList();
  }
}