import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scraper_wallpaper_app/modals/wallpeper_modal.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<Wallpepers?> getWallpepers({String query = "nature"}) async {
    String wallpeperApi =
        "https://pixabay.com/api/?key=38380579-ad3f6cb78dd787d8ea5510b22=$query";

    http.Response response = await http.get(Uri.parse(wallpeperApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Wallpepers allData = Wallpepers.fromMap(data: data);
      return allData;
    }
  }
}
