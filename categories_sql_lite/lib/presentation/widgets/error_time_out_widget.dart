
import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ErrorTimeOutWidget<T> extends StatelessWidget {
  const ErrorTimeOutWidget({
    super.key,
    required this.page,
    this.group,
  });

  final int page;
  final Group? group;

  @override
  Widget build(BuildContext context) {
    var blocBloc = context.read<T>();
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (GroupsBloc is GroupsBloc)?
            Text('isTimeOut  :${(blocBloc as GroupsBloc).groupsModelData.isTimeOut.toString()}'):
            Text('isTimeOut  :${(blocBloc as CategoriesBloc).categoriesModelData.isTimeOut.toString()}'),
            (GroupsBloc is GroupsBloc)?
            Text('isError  :${(blocBloc as GroupsBloc).groupsModelData.isError.toString()}'):
            Text('isError  :${(blocBloc as CategoriesBloc).categoriesModelData.isError.toString()}'),
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