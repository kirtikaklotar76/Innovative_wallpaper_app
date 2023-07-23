import 'package:flutter/cupertino.dart';
import 'helpers/api_helper.dart';

class ApiControllers extends ChangeNotifier {
  List data = [];

  ApiControllers() {
    search();
  }

  search({String val = "nature"}) async {
    data = await APIHelper.apiHelper.getWallpepers(query: val) ?? [];
    notifyListeners();
  }
}
