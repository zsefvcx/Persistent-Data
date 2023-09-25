import 'package:flutter/material.dart';
import 'package:users_data_app_floor/presentation/pages.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    Widget transitionsBuilder(context, Animation<double> animation, Animation<double> secondaryAnimation, Widget? child) {
      final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn);
      final anim =
      Tween<double>(begin: 0, end: 1).animate(curved);
      return ScaleTransition(
        scale: anim,
        child: FadeTransition(opacity: animation, child: child,),
      );
    }

    switch (settings.name) {
      case PhotosPage.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const PhotosPage(title: 'Users',),
          transitionsBuilder: transitionsBuilder,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Page not found!'),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(PhotosPage.routeName);
                  },
                  child: const Center(
                    child: Text(
                        'Goto GroupsPages', style: TextStyle(color: Colors
                        .blue)),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
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
