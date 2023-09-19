import 'package:flutter/material.dart';

import 'core/core.dart';
import 'presentation /pages.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    Widget transitionsBuilder(context, animation, secondaryAnimation, child){
      CurvedAnimation curved = CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn);
      Animation<double> anim =
      Tween<double>(begin: 0.0, end: 1.0).animate(curved);
      return ScaleTransition(
        scale: anim,
        child: FadeTransition(opacity: animation, child: child,),
      );
    }

    switch(settings.name){
      case GroupsPage.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const GroupsPage(title: 'Categories',),
          transitionsBuilder: transitionsBuilder,
        );
      case CategoriesPage.routeName:
        if(args != null && args is Group) {
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CategoriesPage(group: args),
              transitionsBuilder: transitionsBuilder,
            );
        }
        return _errorRoute();
      case CategoryPage.routeName:
        if(args != null && args is Category) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                CategoryPage(category: args),
            transitionsBuilder: transitionsBuilder,
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Page not found!'),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(GroupsPage.routeName);
                  },
                  child: const Center(
                    child: Text('Goto GroupsPages', style: TextStyle(color: Colors.blue)),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: const Center(
                    child: Text('Back', style: TextStyle(color: Colors.blue)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
      fullscreenDialog: true,
    );
  }
}

