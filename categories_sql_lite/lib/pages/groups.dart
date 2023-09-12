
import 'package:flutter/material.dart';

class GroupsPages extends StatefulWidget {
  const GroupsPages({super.key, required this.title});

  final String title;

  @override
  State<GroupsPages> createState() => _GroupsPagesState();
}

class _GroupsPagesState extends State<GroupsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text(widget.title),
          centerTitle: true,
        ),
        body: const Placeholder());
  }
}
