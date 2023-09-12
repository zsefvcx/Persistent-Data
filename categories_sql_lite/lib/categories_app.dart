import 'package:categories_sql_lite/pages/groups.dart';
import 'package:flutter/material.dart';

class CategoriesApp extends StatelessWidget {
  const CategoriesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categories',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GroupsPages(title: 'Categories'),
    );
  }
}