import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import 'dialog/dialog.dart';

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

  int age = 18;

  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    Logger.print('Init Card ${user.id}', name: 'log', level: 0, error: false);
  }

  @override
  void dispose() {
    super.dispose();
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
                      var res = await showDialog<(bool, User)>(
                      context: context,
                      builder: (BuildContext context)
                      {
                        return DialogBuilder(user: user);
                      });
                      if(res !=null && res.$1){
                        setState(() {
                          user = res.$2;
                        });
                      }
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
}
