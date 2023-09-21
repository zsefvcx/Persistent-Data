

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import 'custom_text_form_field.dart';
import 'dialog_fields_controllers.dart';

class DialogBuilder extends StatefulWidget {
  const DialogBuilder({
    super.key,
    this.user
  });

  final User? user;

  @override
  State<DialogBuilder> createState() => _DialogBuilderState();
}

class _DialogBuilderState extends State<DialogBuilder> {

  final _formKey = DialogFieldsAndControllers.formKey;
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

    DialogFieldsAndControllers.initControllers(user: _user);
  }

  @override
  void dispose() {
    super.dispose();
    DialogFieldsAndControllers.disposeControllers();
  }

  void showSnackBar(String massage){
    final snackBar = SnackBar(
      content: Text(massage),
      action: SnackBarAction(
        label: 'Ок',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<(bool, User)> addOrModData(UsersBloc usersBloc) async {
    User modifyUser = DialogFieldsAndControllers.userData(oldData: _user);

    if (modifyUser == _user)
    {
      showSnackBar('Identical! No need safe to data.');
     Logger.print("Identical! No need safe to data.", name: 'log', level: 0, error: false);
     return (false, _user);
    }

    if(modifyUser.image != _user.image )
    {
      String? locator= await usersBloc.writeToFile(modifyUser.image, modifyUser.locator);
      if(locator == null) {
        showSnackBar('Image is not loaded');
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
                  ...DialogFieldsAndControllers.allFields.map((e) => TextFFC(dialogFields: e,)),
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
                var (res, _) = await addOrModData(usersBloc);
                if (res == true) Navigator.of(context).pop();
              } else {
                process = true;
                var (res, modUser) = await addOrModData(usersBloc);
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

