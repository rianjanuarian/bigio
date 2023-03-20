import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/model/repository.dart';
import 'package:starwars/ui/selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SignikaNegative'),
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => PersonRepo(),
        child: const Selection(),
      ),
    );
  }
}
