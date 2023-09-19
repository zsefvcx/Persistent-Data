
import 'package:flutter/material.dart';
import 'package:photo_aql_lite/domain/domain.dart';
import 'package:provider/provider.dart';


import 'route_generator.dart';

class PhotoApp extends StatefulWidget {
  const PhotoApp({super.key});

  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  late final GroupsBloc _groupsBloc;

  @override
  void initState() {
    super.initState();
    _groupsBloc = BlocFactory.instance.get<GroupsBloc>();
    _groupsBloc.add(const GroupsBlocEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GroupsBloc>(
            create: (_) =>
            _groupsBloc),
      ],
      child: MaterialApp(
        title: 'Categories',
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
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