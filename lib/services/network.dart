import 'package:http/http.dart';
import 'package:SportsHulk/constants/strings.dart';

class Network {
  String url = SPORTSHULK_URL;
  Network(this.url);

  Future getPosts() async {
    print('Calling uri: ' + url + "wp-json/wp/v2/posts/?per_page=100");

    Response response = await get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
