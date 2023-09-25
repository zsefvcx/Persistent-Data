import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/domain/domain.dart';
import 'package:users_data_app_floor/presentation/widgets/dialogs/custom_text_form_field.dart';
import 'package:users_data_app_floor/presentation/widgets/dialogs/users/dialog_users_fields_controllers.dart';
import 'package:uuid/uuid.dart';

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
    final modifyUser = DialogUsersFieldsAndControllers.userData(oldData: _user);

    if (modifyUser == _user)
    {
     Logger.print('Identical! No need safe to data.', context: context);
     return (false, _user);
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
    Logger.print('$modifyUser');
    return (true, modifyUser);
  }

  @override
  Widget build(BuildContext context) {
    final usersBloc = context.read<UsersBloc>();
    var process = false;
    return AlertDialog(
      title: Center(child: _user.id!=null?const Text('Modify User'):const Text('Add User')),
      content: Container(
        constraints: const BoxConstraints(maxHeight: 400),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            height: 700,
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
            final cSt = _formKey.currentState;

            if(cSt != null && cSt.validate() && !process){
              if(_user.id == null){
                final (res, _) = await addOrModData(usersBloc, context);
                if (res) Navigator.of(context).pop();
              } else {
                process = true;
                final (res, modUser) = await addOrModData(usersBloc, context);
                process = false;
                if (res) Navigator.of(context).pop((res, modUser));
              }
            }
          },
        ),
      ],
    );
  }
}
