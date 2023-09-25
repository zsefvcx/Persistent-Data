import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/domain/domain.dart';
import 'package:users_data_app_floor/presentation/widgets/dialogs/cards/dialog_cards_fields_controllers.dart';
import 'package:users_data_app_floor/presentation/widgets/dialogs/custom_text_form_field.dart';

class DialogCardsAddModifyBuilder extends StatefulWidget {
  const DialogCardsAddModifyBuilder({required this.uuidUser, super.key,
    this.cardDetail,
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
        uuidUser: widget.uuidUser,
    );

    DialogCardsFieldsAndControllers.initControllers(data: _cardDetail);
  }

  @override
  void dispose() {
    super.dispose();
    DialogCardsFieldsAndControllers.disposeControllers();
  }

  Future<(bool, CardDetail)> addOrModData(UsersBloc usersBloc, BuildContext context) async {
    final modifyCardDetail = DialogCardsFieldsAndControllers.userData(oldData: _cardDetail);

    if (modifyCardDetail == _cardDetail)
    {
      Logger.print('Identical! No need safe to data.', context: context);
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
    Logger.print('$modifyCardDetail');
    return (true, modifyCardDetail);
  }

  @override
  Widget build(BuildContext context) {
    final usersBloc = context.read<UsersBloc>();
    var process = false;
    return AlertDialog(
      title: const Center(child: Text('Card User')),
      content: Container(
        constraints: const BoxConstraints(maxHeight: 400),
        child: SingleChildScrollView(
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
            final cSt = _formKey.currentState;

            if(cSt != null && cSt.validate() && !process){
              if(_cardDetail.id == null){
                final (res, modUser) = await addOrModData(usersBloc, context);
                if (res) Navigator.of(context).pop((res, modUser));
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
