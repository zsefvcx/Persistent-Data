
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'route_generator.dart';

class CategoriesApp extends StatefulWidget {
  const CategoriesApp({super.key});

  @override
  State<CategoriesApp> createState() => _CategoriesAppState();
}

class _CategoriesAppState extends State<CategoriesApp> {
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