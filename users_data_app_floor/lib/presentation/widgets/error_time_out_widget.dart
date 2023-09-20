
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';

class ErrorTimeOutWidget extends StatelessWidget {
  const ErrorTimeOutWidget({
    super.key,
    required this.page,
    this.photo,
  });

  final int page;
  final User? photo;

  @override
  Widget build(BuildContext context) {
    var blocBloc = context.read<PhotosBloc>();
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('isTimeOut  :${blocBloc.groupsModelData.isTimeOut.toString()}'),
            Text('isError  :${blocBloc.groupsModelData.isError.toString()}'),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                    blocBloc.add(PhotosBlocEvent.get(page: page));
                },
                child: const Text('Try again')),
          ],
        ));
  }
}