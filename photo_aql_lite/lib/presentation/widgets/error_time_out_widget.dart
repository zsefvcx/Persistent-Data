
import 'package:flutter/material.dart';
import 'package:photo_aql_lite/domain/domain.dart';
import 'package:provider/provider.dart';

class ErrorTimeOutWidget extends StatelessWidget {
  const ErrorTimeOutWidget({
    super.key,
    required this.page,
    this.group,
  });

  final int page;
  final Group? group;

  @override
  Widget build(BuildContext context) {
    var blocBloc = context.read<GroupsBloc>();
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
                  if(GroupsBloc is GroupsBloc) {
                    (blocBloc as GroupsBloc).add(GroupsBlocEvent.getGroups(page: page));
                  } else if(GroupsBloc is CategoriesBloc) {
                    Group? group = this.group;
                    if(group!=null) {
                      (blocBloc as CategoriesBloc).add(CategoriesBlocEvent.getCategories(group: group, page: page));
                    }
                  }
                },
                child: const Text('Try again')),
          ],
        ));
  }
}