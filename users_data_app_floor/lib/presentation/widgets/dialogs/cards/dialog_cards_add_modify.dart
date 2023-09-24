import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../custom_text_form_field.dart';
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

  Future<(bool, CardDetail)> addOrModData(UsersBloc usersBloc, BuildContext context) async {
    CardDetail modifyCardDetail = DialogCardsFieldsAndControllers.userData(oldData: _cardDetail);

    if (modifyCardDetail == _cardDetail)
    {
      Logger.print("Identical! No need safe to data.", name: 'log', level: 0, error: false, context: context);
      return (false, _cardDetail);
    }

    if (modifyCardDetail.id != null){
        usersBloc.add(UsersBlocEvent.insertCard(
          value: modifyCardDetail,
        ),
      );
    } else {
        usersBloc.add(UsersBlocEvent.updateCard(
          value: modifyCardDetail,
        ),
      );
    }
    Logger.print('$modifyCardDetail', name: 'log', level: 0, error: false);
    return (true, modifyCardDetail);
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
            height: 400,
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
            Navigator.of(context).pop((false, _cardDetail));
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: _cardDetail.cardNum!=null?const Text('Modify'):const Text('Add'),
          onPressed: () async {
            var cSt = _formKey.currentState;

            if(cSt != null && cSt.validate() && process == false){
              if(_cardDetail.id == null){
                var (res, modUser) = await addOrModData(usersBloc, context);
                if (res == true) Navigator.of(context).pop((res, modUser));
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
