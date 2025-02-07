import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => SomeBloc(), // Add your actual BLoC here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// Replace with your actual Bloc
class SomeBloc extends Cubit<int> {
  SomeBloc() : super(0);
}
