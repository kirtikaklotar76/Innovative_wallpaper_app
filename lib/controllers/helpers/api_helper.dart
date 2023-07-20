import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../modals/post_modal.dart';

class APiHelper {
  APiHelper._();

  static final APiHelper apiHelper = APiHelper._();

  int userId = 1;

  getId({int num = 1}) {
    userId = num;
    getSingleResponse();
  }

  getSingleResponse() async {
    String api = "https://jsonplaceholder.typicode.com/posts/$userId";
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      Posts post = Posts.fromMap(data: data);
      return post;
    }
  }
}
