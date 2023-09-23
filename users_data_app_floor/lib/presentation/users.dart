
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/core.dart';
import '../domain/domain.dart';
import 'widgets/dialogs/users/dialog_users_add_modify.dart';
import 'widgets/error_time_out_widget.dart';
import 'widgets/user_card.dart';


class PhotosPage extends StatefulWidget {
  static const routeName = '/';

  const PhotosPage({super.key, required this.title});

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
    UsersBloc usersBloc = context.read<UsersBloc>();
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
                            Logger.print('Build Card $i', name: 'log', level: 0, error: false);
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
            padding: const EdgeInsets.only(right: 54),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () async {
                    await showDialog<void>(
                    context: context,
                    builder: (BuildContext context)
                    {
                    return const DialogAddModifyBuilder();
                    });
                  },
                  tooltip: 'Load',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10,),
                FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () async {
                    loadData(usersBloc);
                    //Logger.print('${Categories.instance().group}', name: 'log', level: 0, error: false);
                  },
                  tooltip: 'Reload',
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
