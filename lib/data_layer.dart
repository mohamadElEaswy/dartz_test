import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class DataServices extends ChangeNotifier {
  bool isLoading = false;
  Option<Either<Unit, List<int>>> dataEO = none();

  void fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    if (Random().nextBool()) {
      final List<int> fetchedData = [1, 2, 3];
      dataEO = some(right(fetchedData));
    } else {
      dataEO = some(left(unit));
    }
    notifyListeners();
  }
}
