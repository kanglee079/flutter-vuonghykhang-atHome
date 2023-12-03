import 'package:app_tintuc/models/detail.dart';
import 'package:app_tintuc/repository/detail_repo.dart';
import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  Future<List<Detail>> getApiDetail(int id, {int limit = 4}) async {
    List<Detail> data = await DetailRepository().getApiDetail(id, limit: limit);
    return data;
  }
}
