import 'package:app_tintuc/apps/share/share_pre.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  List<int> listIdCategoryActive = [];

  Future<void> getDataInShare() async {
    List<int> data = await SharePreCustom.getData();
    listIdCategoryActive = data;
    notifyListeners();
  }

  void activeCheck(int id) async {
    if (listIdCategoryActive.contains(id)) {
      listIdCategoryActive.remove(id);
    } else {
      listIdCategoryActive.add(id);
    }
    print(listIdCategoryActive);
    await SharePreCustom.saveData(listIdCategoryActive);
    notifyListeners();
  }
}
