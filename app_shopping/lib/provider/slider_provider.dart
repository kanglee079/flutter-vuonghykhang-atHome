import 'package:app_shopping/apps/models/sliders.dart';
import 'package:app_shopping/repository/slider_repo.dart';
import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  Future<List<SliderModels>> getSlider() async {
    List<SliderModels> data = await SliderRepository().fetchSliders();
    return data;
  }
}
