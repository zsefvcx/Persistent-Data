
import 'package:flutter/material.dart';

import '../core/core.dart';
import '../db/database.dart';
import 'widgets/group_card.dart';

class GroupsPage extends StatefulWidget {
  static const routeName = '/';

  const GroupsPage({super.key, required this.title});

  final String title;

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {

  late bool _isLoading;
  final TextEditingController _group = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  Future<void> loadData() async {
    Categories.instance().group.clear();
    setState(() {
      _isLoading = false;
    });
    Categories.instance().group.addAll(await DBProvider.db.getGroups());
    await Future.delayed(const Duration(seconds: 1), (){
      setState(() {
        _isLoading = true;
      });
    }
    );
  }

  Future<void> addData() async {
    setState(() {
      _isLoading = false;
    });
    await Categories.instance().group.addEx(value: Group(
        gid: null,
        group: _group.text,
        description: _description.text
      ),
    );
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _group.dispose();
    _description.dispose();
    Categories.instance().group.clear();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
          return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title:Text(widget.title),
          ),
        body: _isLoading==false
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
              itemCount: Categories.instance().group.length,
              itemBuilder: (_, i) => GroupCard(group: Categories.instance().group.toList()[i]),
              separatorBuilder: (_, __) => const Divider(color: Colors.lightGreenAccent),
            ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: (){
                  _dialogBuilder(context);
                  Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);
                },
                tooltip: 'Add a new Group',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10,),
              FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: () async {
                  await loadData();
                  Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);
                },
                tooltip: 'Reload Groups',
                child: const Icon(Icons.update),
              ),
            ],
          ),
        ),
      ),
    );

  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new Group'),
          content: SizedBox(
            width: 300,
            height: 200,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _group,
                      maxLines: 1,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Group Name',
                      ),
                      validator: (text) =>
                          (text == null || text.isEmpty)?
                          'Text is empty':
                          null,
                    ),
                  ),
                  const Divider(height: 20,),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _description,
                            keyboardType: TextInputType.multiline,
                            maxLines: 1, //grow automatically
                            maxLength: 40,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Add'),
              onPressed: () async {
                var cSt = _formKey.currentState;
                if(cSt != null && cSt.validate()){
                  addData();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
