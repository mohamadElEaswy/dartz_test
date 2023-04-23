import 'dart:developer';

import 'package:flutter/material.dart';

class DataServices extends ChangeNotifier {
  bool isLoading = false;
  List<int>? data;

  void fetchData() async {
    log('-----init----');
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));

    final List<int> fetchedData = [1, 2, 3];
    data = fetchedData;
    isLoading = false;
    log('----message----');
    notifyListeners();
  }
}
