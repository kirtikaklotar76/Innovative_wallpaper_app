import 'package:flutter/cupertino.dart';

import '../modals/post_modal.dart';
import 'helpers/api_helper.dart';

class ApiControllers extends ChangeNotifier {
  // Posts? post;
  //
  // Future<void> getData() async {
  //   post = await APiHelper.apiHelper.getSingleResponse();
  //   notifyListeners();
  // }

  List data = [];

  ApiControllers() {
    search();
  }
  search({String val = "nature"}) async {
    data = await APIHelper.apiHelper.getWallpepers(query: val) ?? [];
    notifyListeners();
    return 0;
  }
}
