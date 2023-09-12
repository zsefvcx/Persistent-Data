
import 'package:flutter/material.dart';

import '../core/core.dart';
import 'widgets/group_card.dart';

class GroupsPages extends StatefulWidget {
  const GroupsPages({super.key, required this.title});

  final String title;

  @override
  State<GroupsPages> createState() => _GroupsPagesState();
}

class _GroupsPagesState extends State<GroupsPages> {

  late bool _isLoading;

  Future<void> loadData() async {
    _isLoading = false;
    await Future.delayed(const Duration(seconds: 5), (){
        setState(() {
          _isLoading = true;
        });
      }
    );

  }


  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title),
          centerTitle: true,
        ),
      body: _isLoading==false
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
            itemCount: Categories.instance().group.length,
            itemBuilder: (_, i) => GroupCard(group: Categories.instance().group.toList()[i]),
            separatorBuilder: (_, __) => const Divider(color: Colors.lightGreenAccent),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Logger.print('Add a new Group', name: 'log', level: 0, error: false);
          Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);
        },
        tooltip: 'Add a new Category',
        child: const Icon(Icons.add),
      ),
    );

  }
}
