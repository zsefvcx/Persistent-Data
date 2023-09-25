
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/domain/domain.dart';

class ErrorTimeOutWidget extends StatelessWidget {
  const ErrorTimeOutWidget({
    required this.page, super.key,
    this.photo,
  });

  final int page;
  final User? photo;

  @override
  Widget build(BuildContext context) {
    final blocBloc = context.read<UsersBloc>();
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isTimeOut  :${blocBloc.usersModelData.isTimeOut}'),
            Text('isError  :${blocBloc.usersModelData.isError}'),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                    blocBloc.add(UsersBlocEvent.get(page: page));
                },
                child: const Text('Try again')),
          ],
        ));
  }
}
