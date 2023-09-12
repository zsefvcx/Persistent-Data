import 'package:flutter/material.dart';

import 'core/core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categories',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Categories'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '....................',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Logger.print('Add a new Category', name: 'log', level: 0, error: false);

          Map<String, dynamic> test = {};

          // Categories.instance().categories.add(key: '100001', value:
          //   const Category(
          //       id: 0,
          //       category: 'category',
          //       description: 'description',
          //       image: 'image',
          //       group: '101500',
          //       gid: 0,
          //   )
          // );
          // Logger.print('Categories: ${Categories.instance()}', name: 'log', level: 0, error: false);
          // Categories.instance().categories.mod(key: '100001', value:
          // const Category(
          //   id: 2,
          //   category: 'category',
          //   description: 'description',
          //   image: 'image',
          //   group: '101500',
          //   gid: 0,
          // )
          // );
          // Logger.print('Categories: ${Categories.instance()}', name: 'log', level: 0, error: false);
          // Categories.instance().categories.mod(key: '100002', value:
          // const Category(
          //   id: 2,
          //   category: 'category',
          //   description: 'description',
          //   image: 'image',
          //   group: '101500',
          //   gid: 0,
          // )
          // );
          Logger.print('Categories: ${Categories.instance()}', name: 'log', level: 0, error: false);
        },
        tooltip: 'Add a new Category',
        child: const Icon(Icons.add),
      ),
    );
  }
}
