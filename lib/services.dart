import 'package:SportsHulk/constants/strings.dart';
import 'package:SportsHulk/model/featuredmedia.dart';
import 'package:SportsHulk/model/posts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

String postsURL = SPORTS_HULK_URL + POSTS_QUERY_PARAMETERS;
String featuredmediaURL = SPORTS_HULK_URL + FEATURED_MEDIA_QUERY_PARAMETERS;
List<Posts> posts;
List<FeaturedMedia> featuredmedias;

class Services {
  static Future<List<Posts>> getPosts({BuildContext context}) async {
    try {
      final response = await http.get(postsURL);
      if (200 == response.statusCode) {
        posts = postsFromJson(response.body);
      } else {
        return List<Posts>();
      }
    } catch (e) {
      return List<Posts>();
    }
    return posts;
  }

  static Future<List<FeaturedMedia>> getFeaturedMedia(
      {BuildContext context, int media}) async {
    try {
      final response = await http.get(featuredmediaURL);
      if (200 == response.statusCode) {
        featuredmedias = featuredMediaFromJson(response.body);
      } else {
        return List<FeaturedMedia>();
      }
    } catch (e) {
      return List<FeaturedMedia>();
    }
    return featuredmedias;
  }
}
