import 'package:dartz/dartz.dart';
import 'package:dartz_test/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dartz Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<DataServices>(
        create: (context) => DataServices()..fetchData(),
        child: Center(
          child: Consumer<DataServices>(
            builder: (BuildContext context, DataServices value, Widget? child) {
              return value.dataEO.fold(
                () => const Text('Fetching Data'),
                (dataE) => dataE.fold(
                  (Unit left) => const Text('Error...'),
                  (List<int> right) => Text(right.length.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
