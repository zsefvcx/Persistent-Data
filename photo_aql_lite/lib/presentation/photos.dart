
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_aql_lite/core/core.dart';
import 'package:photo_aql_lite/domain/domain.dart';

import 'widgets/error_time_out_widget.dart';
import 'widgets/pthoto_card.dart';

class GroupsPage extends StatefulWidget {
  static const routeName = '/';

  const GroupsPage({super.key, required this.title});

  final String title;

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {

  final TextEditingController _group = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  Future<void> loadData() async {
    context.read<GroupsBloc>().add(const GroupsBlocEvent.getGroups(page: 0));
  }

  Future<void> addData() async {
    context.read<GroupsBloc>().add(GroupsBlocEvent.insertGroup(
        value: Group(
          gid: null,
          group: _group.text,
          description: _description.text,
          image: _image.text,
          locator: ''
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _group.dispose();
    _image.dispose();
    _description.dispose();
    //GroupsEntity.instance().group.clear();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
          return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
              title:Text(widget.title),
            ),
          body: SafeArea(
            child: BlocBuilder<GroupsBloc, GroupsBlocState>(
              builder: (context, state) {
                return state.map(
                  loading: (_) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (_) {
                    return const ErrorTimeOutWidget(page: 0,);
                  },
                  timeOut: (_) {
                    return const ErrorTimeOutWidget(page: 0,);
                  },
                  loaded: ( value) {
                    return ListView.separated(
                               itemCount: value.model.groups.groups.length,
                               itemBuilder: (_, i) => PhotoCard(group: value.model.groups.groups.toList()[i]),
                               separatorBuilder: (_, __) => const SizedBox(height: 10),
                    );
                  },
                );
              },
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: (){
                    _dialogBuilder(context);
                    //Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);
                  },
                  tooltip: 'Add',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10,),
                FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () async {
                    await loadData();
                    //Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);
                  },
                  tooltip: 'Reload',
                  child: const Icon(Icons.update),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  void _dialogBuilder(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Hero(
          tag: 'animateHero',
          child: AlertDialog(
            title: const Text('Add a new Photo'),
            content: SizedBox(
              width: 300,
              height: 300,
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
                          labelText: 'Photo Name',
                        ),
                        validator: (text) =>
                            (text == null || text.isEmpty)?
                            'Text is empty':
                            null,
                      ),
                    ),
                    const Divider(height: 20,),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: _image,
                        maxLength: 255,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Image URL',
                        ),
                        validator: (value) {
                          ///Используем встроенный валидатор
                          if(value != null){
                            final Uri? uri = Uri.tryParse(value);
                            if(uri != null) {
                              if (!uri.hasAbsolutePath) {
                                return 'Please enter valid url';
                              } else {
                                return null;
                              }
                            }
                          }
                          return 'Please enter valid url';
                          ///Используем регулярные выражения
                          // String hasValidUrl(String value) {
                          //   String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                          //   RegExp regExp = new RegExp(pattern);
                          //   if (value.length == 0) {
                          //     return 'Please enter url';
                          //   }
                          //   else if (!regExp.hasMatch(value)) {
                          //     return 'Please enter valid url';
                          //   }
                          //   return null;
                          // }
                        },
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
          ),
        );
      },
    );
  }
}
