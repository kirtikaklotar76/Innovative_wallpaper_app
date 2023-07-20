import 'package:flutter/cupertino.dart';

import '../modals/post_modal.dart';
import 'helpers/api_helper.dart';

class ApiControllers extends ChangeNotifier {
  Posts? post;

  Future<void> getData() async {
    post = await APiHelper.apiHelper.getSingleResponse();
    notifyListeners();
  }
}
