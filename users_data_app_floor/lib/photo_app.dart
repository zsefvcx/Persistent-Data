
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_data_app_floor/domain/domain.dart';
import 'package:users_data_app_floor/route_generator.dart';

class PhotoApp extends StatefulWidget {
  const PhotoApp({super.key});

  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  late final UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _usersBloc = BlocFactory.instance.get<UsersBloc>();
    _usersBloc.add(const UsersBlocEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UsersBloc>(
            create: (_) =>
            _usersBloc),
      ],
      child: MaterialApp(
        title: 'Users',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
