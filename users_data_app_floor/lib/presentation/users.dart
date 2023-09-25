
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/domain/bloc/bloc.dart';
import 'package:users_data_app_floor/presentation/widgets/dialogs/users/dialog_users_add_modify.dart';
import 'package:users_data_app_floor/presentation/widgets/error_time_out_widget.dart';
import 'package:users_data_app_floor/presentation/widgets/user_card.dart';


class PhotosPage extends StatefulWidget {
  static const routeName = '/';

  const PhotosPage({required this.title, super.key});

  final String title;

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {

  void loadData(UsersBloc usersBloc) {
    usersBloc.add(const UsersBlocEvent.get(page: 0));
  }

  @override
  Widget build(BuildContext context) {
    final usersBloc = context.read<UsersBloc>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(widget.title),
          ),
          body: SafeArea(
            child: BlocBuilder<UsersBloc, UsersBlocState>(
              builder: (context, state) {
                return state.map(
                  loading: (_) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (_) {
                    return const ErrorTimeOutWidget(page: 0,);
                  },
                  timeOut: (_) {
                    return const ErrorTimeOutWidget(page: 0,);
                  },
                  loaded: (value) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        final completer = Completer();
                        usersBloc.add(UsersBlocEvent.getCompleter(page: 0, completer: completer));
                        return completer.future;
                      },
                      child: ScrollConfiguration(// + windows
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                        ),
                        child: ListView.separated(
                          itemCount: value.model.data.users.length,
                          itemBuilder: (_, i) {
                            Logger.print('Build Card $i');
                            return UserCard(user: value.model.data.users.toList()[i]);
                          },
                          separatorBuilder: (_, __) => const SizedBox(height: 10),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  mini: true,
                  heroTag: UniqueKey(),
                  onPressed: () async {
                    await showDialog<void>(
                    context: context,
                    builder: (context)
                    {
                    return const DialogAddModifyBuilder();
                    });
                  },
                  tooltip: 'Add',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10,),
                FloatingActionButton(
                  mini: true,
                  heroTag: UniqueKey(),
                  onPressed: () async {
                    loadData(usersBloc);
                    //Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);
                  },
                  tooltip: 'Update',
                  child: const Icon(Icons.update),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
