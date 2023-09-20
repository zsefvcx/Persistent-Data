
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/core.dart';
import '../domain/domain.dart';
import 'widgets/error_time_out_widget.dart';
import 'widgets/user_card.dart';


class PhotosPage extends StatefulWidget {
  static const routeName = '/';

  const PhotosPage({super.key, required this.title});

  final String title;

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {

  final TextEditingController _group = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  Future<void> loadData(UsersBloc photosBloc) async {
    photosBloc.add(const UsersBlocEvent.get(page: 0));
  }

  Future<void> addData(UsersBloc usersBloc) async {
    final uuid = await usersBloc.writeToFile(_image.text);
    usersBloc.add(UsersBlocEvent.insert(
        value: User(
          id: null,
          lastName: '',
          name: _group.text,
          firstName: '',
          age: 18,
          image: _image.text,
          locator: uuid,
          uuid: '',
          phone: '',
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
  }

  @override
  Widget build(BuildContext context) {
    UsersBloc usersBloc = context.read<UsersBloc>();
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
            child: BlocBuilder<UsersBloc, UsersBlocState>(
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
                               itemCount: value.model.data.users.length,
                               itemBuilder: (_, i) => UserCard(user: value.model.data.users.toList()[i]),
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
                    _dialogBuilder(context, usersBloc);
                    //Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);
                  },
                  tooltip: 'Load',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10,),
                FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () async {
                    await loadData(usersBloc);
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

  void _dialogBuilder(BuildContext context, UsersBloc usersBloc) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Hero(
          tag: 'animateHero',
          child: AlertDialog(
            title: const Center(child: Text('Add a new Photo')),
            content: SizedBox(
              width: 300,
              height: 180,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: _group,
                        maxLines: 1,
                        maxLength: 255,
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
                child: const Text('Load'),
                onPressed: () {
                  var cSt = _formKey.currentState;
                  if(cSt != null && cSt.validate()){
                    addData(usersBloc);
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
