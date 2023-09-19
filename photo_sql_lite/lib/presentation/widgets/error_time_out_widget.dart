
import 'package:flutter/material.dart';
import 'package:photo_sql_lite/core/core.dart';
import 'package:photo_sql_lite/domain/domain.dart';
import 'package:provider/provider.dart';

class ErrorTimeOutWidget extends StatelessWidget {
  const ErrorTimeOutWidget({
    super.key,
    required this.page,
    this.photo,
  });

  final int page;
  final Photo? photo;

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