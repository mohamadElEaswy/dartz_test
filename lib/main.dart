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
      title: 'Flutter Demo',
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
              builder: (context, value, child) => value.isLoading
                  ? const Text('Fetching Data')
                  : Text(value.data!.length.toString())),
        ),
      ),
    );
  }
}
