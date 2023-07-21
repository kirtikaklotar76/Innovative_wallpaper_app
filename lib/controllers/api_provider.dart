import 'package:flutter/cupertino.dart';

import '../modals/post_modal.dart';
import 'helpers/api_helper.dart';

class ApiControllers extends ChangeNotifier {
  List data = [];

  ApiControllers() {
    search();
    // getWallpeper();
  }
  // getWallpeper() async {
  //   data = await APIHelper.apiHelper.getWallpepers() ?? [];
  //   return data;
  // }

  search({String val = "nature"}) async {
    data = await APIHelper.apiHelper.getWallpepers(query: val) ?? [];
    notifyListeners();
    return data;
  }
}
