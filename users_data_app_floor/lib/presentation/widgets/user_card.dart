import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _age = TextEditingController();
  int age = 18;

  final _formKey = GlobalKey<FormState>();
  late User user;

  Future<void> modifyData(UsersBloc usersBloc) async {
    String? locator;
    if(_image.text != user.image) {
      locator = await usersBloc.writeToFile(_image.text, user.locator);
    }
    final modifyUser = User(
      id: user.id,
      firstName: _firstName.text,
      name: _name.text,
      lastName: _lastname.text,
      age: age,
      image: _image.text,
      locator: locator ?? user.locator,
      uuid: user.uuid,
      phone: _phone.text,
    );
    if (modifyUser == user){
      Logger.print("Identical! No need safe to data.", name: 'log', level: 0, error: false);
      return;
    }
    usersBloc.add(UsersBlocEvent.update(
        oldValue: user,
        value: modifyUser,
      ),
    );
    setState(() {
      user = modifyUser;
    });
    Logger.print("$user", name: 'log', level: 0, error: false);
  }

  @override
  void initState() {
    super.initState();
    user = widget.user;
    Logger.print('Init Card ${user.id}', name: 'log', level: 0, error: false);
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _image.dispose();
    Logger.print('Dispose Card ${user.id}', name: 'log', level: 0, error: false);
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
                  future: usersBloc.getUint8List(user.locator),
                    builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                      Logger.print('Get img uuid:"${user.locator}" for Card ${user.id}', name: 'log', level: 0, error: false);
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
                          Text('Name:  ${user.firstName} ${user.name} ${user.lastName}'),
                          Text('Age:   ${user.age}'),
                          Text('Phone: ${user.phone}'),
                        ],
                      ),
                    ),
                  ),
                )
            ),
            Column(
              children: [
                Center(child: Text('${user.id}')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      _image.text = user.image;
                      _name.text = user.name;
                      _lastname.text = user.lastName;
                      _firstName.text = user.firstName;
                      _phone.text = user.phone;
                      _age.text = user.age.toString();
                      _dialogBuilder(context, usersBloc);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () async {
                        usersBloc.add(UsersBlocEvent.delete(value: user));
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
          title: const Center(child: Text('Modify User')),
          content: Container(
            constraints: const BoxConstraints(maxHeight: 400),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: false,
              child: SizedBox(
                width: 300,
                height: 600,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 280,
                        child: TextFormField(
                          controller: _firstName,
                          maxLines: 1,
                          maxLength: 255,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'First Name',
                          ),
                          validator: (text) =>
                          (text == null || text.isEmpty)?
                          'Text is empty':
                          null,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 280,
                        child: TextFormField(
                          controller: _name,
                          maxLines: 1,
                          maxLength: 255,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          validator: (text) =>
                          (text == null || text.isEmpty)?
                          'Text is empty':
                          null,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 280,
                        child: TextFormField(
                          controller: _lastname,
                          maxLines: 1,
                          maxLength: 255,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Last Name',
                          ),
                          validator: (text) =>
                          (text == null || text.isEmpty)?
                          'Text is empty':
                          null,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 280,
                        child: TextFormField(
                          controller: _age,
                          maxLines: 1,
                          maxLength: 255,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Age',
                          ),
                          validator: (text) {
                            if(text == null || text.isEmpty) return 'Text is empty';
                            int? age = int.tryParse(text);
                            if (age == null ) return 'Age is not recognise';
                            if (age < 18 || age > 110) return 'Age is wrong';
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 280,
                        child: TextFormField(
                          controller: _phone,
                          maxLines: 1,
                          maxLength: 255,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone int format +7 (XXX) XXX-XX-XX',
                          ),
                          validator: (text) {
                            if(text == null || text.isEmpty) return 'Text is empty';
                            if(!RegExp(r'(^[\+]?[0-9]{1,3}[-\s\.]?[(]?[0-9]{2,3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{2}[-\s\.]?[0-9]{2}$)').hasMatch(text ?? '')){
                              return 'Format Phone number is wrong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: 280,
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
