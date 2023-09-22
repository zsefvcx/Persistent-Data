

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import 'custom_text_form_field.dart';
import 'dialog_users_fields_controllers.dart';

class DialogAddModifyBuilder extends StatefulWidget {
  const DialogAddModifyBuilder({
    super.key,
    this.user
  });

  final User? user;

  @override
  State<DialogAddModifyBuilder> createState() => _DialogAddModifyBuilderState();
}

class _DialogAddModifyBuilderState extends State<DialogAddModifyBuilder> {
  final _formKey = DialogUsersFieldsAndControllers.formKey;
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user ?? User(
        id: null,
        firstName: '',
        name: '',
        lastName: '',
        locator: null,
        age: 18,
        phone: '',
        image: '',
        uuid: const Uuid().v4.toString(),
    );

    DialogUsersFieldsAndControllers.initControllers(data: _user);
  }

  @override
  void dispose() {
    super.dispose();
    DialogUsersFieldsAndControllers.disposeControllers();
  }

  Future<(bool, User)> addOrModData(UsersBloc usersBloc, BuildContext context) async {
    User modifyUser = DialogUsersFieldsAndControllers.userData(oldData: _user);

    if (modifyUser == _user)
    {
     Logger.print("Identical! No need safe to data.", name: 'log', level: 0, error: false, context: context);
     return (false, _user);
    }

    if(modifyUser.image != _user.image )
    {
      String? locator= await usersBloc.writeToFile(modifyUser.image, modifyUser.locator);
      if(locator == null) {
        if(context.mounted)Logger.print('Image is not loaded', name: 'log', level: 0, error: false, context: context);
        return (false, _user);
      }
      modifyUser = modifyUser.copyWith(
        locator: locator,
      );
    }

    if (modifyUser.id != null){
      usersBloc.add(UsersBlocEvent.update(
          oldValue: _user,
          value: modifyUser,
        ),
      );
    } else {
      usersBloc.add(UsersBlocEvent.insert(
        value: modifyUser,
      ),
      );
    }
    Logger.print("$modifyUser", name: 'log', level: 0, error: false);
    return (true, modifyUser);
  }

  @override
  Widget build(BuildContext context) {
    UsersBloc usersBloc = context.read<UsersBloc>();
    bool process = false;
    return AlertDialog(
      title: Center(child: _user.id!=null?const Text('Modify User'):const Text('Add User')),
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
                  ...DialogUsersFieldsAndControllers.allFields.map((e) => TextFFC(dialogFields: e,)),
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
            Navigator.of(context).pop((false, _user));
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: _user.id!=null?const Text('Modify'):const Text('Add'),
          onPressed: () async {
            var cSt = _formKey.currentState;

            if(cSt != null && cSt.validate() && process == false){
              if(_user.id == null){
                var (res, _) = await addOrModData(usersBloc, context);
                if (res == true) Navigator.of(context).pop();
              } else {
                process = true;
                var (res, modUser) = await addOrModData(usersBloc, context);
                process = false;
                if (res == true) Navigator.of(context).pop((res, modUser));
              }
            }
          },
        ),
      ],
    );
  }
}

