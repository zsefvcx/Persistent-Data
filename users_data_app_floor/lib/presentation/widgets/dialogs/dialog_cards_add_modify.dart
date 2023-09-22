import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import 'custom_text_form_field.dart';
import 'dialog_cards_fields_controllers.dart';

class DialogCardsAddModifyBuilder extends StatefulWidget {
  const DialogCardsAddModifyBuilder({super.key,
    this.cardDetail,
    required this.uuidUser,
  });

  final CardDetail? cardDetail;
  final String uuidUser;

  @override
  State<DialogCardsAddModifyBuilder> createState() => _DialogCardsAddModifyBuilderState();
}

class _DialogCardsAddModifyBuilderState extends State<DialogCardsAddModifyBuilder> {
  final _formKey = DialogCardsFieldsAndControllers.formKey;
  late CardDetail _cardDetail;

  @override
  void initState() {
    super.initState();
    _cardDetail = widget.cardDetail ?? CardDetail(
        id: null,
        uuidUser: widget.uuidUser,
        cardNum: null,
        cardYear: null,
        cardMonth: null);

    DialogCardsFieldsAndControllers.initControllers(data: _cardDetail);
  }

  @override
  void dispose() {
    super.dispose();
    DialogCardsFieldsAndControllers.disposeControllers();
  }

  Future<(bool, User)> addOrModData(UsersBloc usersBloc, BuildContext context) async {
    CardDetail modifyCardDetail = DialogCardsFieldsAndControllers.userData(oldData: _user);

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
      title: const Center(child: Text('Card User')),
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
                  ...DialogCardsFieldsAndControllers.allFields.map((e) => TextFFC(dialogFields: e,)),
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
            Navigator.of(context).pop((false, widget.cardDetail));
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: widget.cardDetail.id!=null?const Text('Modify'):const Text('Add'),
          onPressed: () async {
            var cSt = _formKey.currentState;

            if(cSt != null && cSt.validate() && process == false){
              if(_cardDetail.id == null){
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
