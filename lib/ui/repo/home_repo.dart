import 'dart:convert';

import 'package:elsner_practical/base/base_repo.dart';
import 'package:elsner_practical/entity/home_data.dart';
import 'package:elsner_practical/network/api_manager.dart';
import 'package:elsner_practical/ui/ds/home_ds.dart';
import 'package:elsner_practical/ui/view/home_view.dart';
import 'package:flutter/material.dart';

class HomeRepo extends BaseRepo {
  final HomeView view;
  HomeDs _dsHome = HomeDs();

  ApiManager _apiManager = new ApiManager();

  HomeRepo({
    @required this.view,
  });

  void doApiCall() async {
    var observable = _dsHome
        .homeApi()
        .map((data) {
      return HomeData.fromJson(data);
    });
    _apiManager.subscribeObserver(observable, view);
  }
}
