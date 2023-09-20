import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    super.key,
    required this.photo,
  });

  final User photo;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final TextEditingController _photoName = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late User photo;

  Future<void> modifyData(UsersBloc usersBloc) async {
    final uuid = await usersBloc.writeToFile(_image.text, photo.locator);
    usersBloc.add(UsersBlocEvent.update(
      oldValue: photo,
      value: User(
        id: photo.id,
        firstName: '',
        name: _photoName.text,
        lastName: '',
        age: 18,
        image: _image.text,
        locator: uuid,
        uuid: '',
        phone: '',
      ),
    ),
    );
    setState(() {
      photo = User(
        id: photo.id,
        firstName: '',
        name: _photoName.text,
        lastName: '',
        age: 18,
        image: _image.text,
        locator: uuid,
        uuid: '',
        phone: '',
      );
    });
  }

  @override
  void initState() {
    super.initState();
    photo = widget.photo;
  }

  @override
  void dispose() {
    super.dispose();
    _photoName.dispose();
    _image.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UsersBloc usersBloc = context.read<UsersBloc>();
    return Card(
      child: SizedBox(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent[400],
                radius: 100,
                child: FutureBuilder(
                  future: usersBloc.getUint8List(photo.locator),
                    builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                      if(snapshot.hasError) return const Center(child: Text('Error'),);
                      if(!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator(),);
                      } else {
                        return CircleAvatar(
                          backgroundColor: Colors.greenAccent[400],
                          radius: 100,
                          backgroundImage: MemoryImage(
                                snapshot.requireData,
                            ),
                        );
                      }
                    },
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Name:  ${widget.photo.firstName} ${widget.photo.name} ${widget.photo.lastName}'),
                          Text('Age:   ${widget.photo.age}'),
                          Text('Phone: ${widget.photo.phone}'),
                        ],
                      ),
                    ),
                  ),
                )
            ),
            Column(
              children: [
                Center(child: Text('${widget.photo.id}')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      _image.text = photo.image;
                      _photoName.text = photo.name;
                      _dialogBuilder(context, usersBloc);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () async {
                        usersBloc.add(UsersBlocEvent.delete(value: photo));
                      },
                      icon: const Icon(Icons.delete_forever)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _dialogBuilder(BuildContext context, UsersBloc photosBloc) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                      controller: _photoName,
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
              child: const Text('Modify'),
              onPressed: () async {
                var cSt = _formKey.currentState;
                if(cSt != null && cSt.validate()){
                  modifyData(photosBloc);
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
