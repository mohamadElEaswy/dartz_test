import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class DataServices extends ChangeNotifier {
  bool isLoading = false;
  Option<List<int>> dataOption = none();

  void fetchData() async {
    log('-----init----');
    await Future.delayed(const Duration(seconds: 2));

    final List<int> fetchedData = [1, 2, 3];
    dataOption = some(fetchedData);
    log('----message----');
    notifyListeners();
  }
}
