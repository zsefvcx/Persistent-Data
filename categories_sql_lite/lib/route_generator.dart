import 'package:categories_sql_lite/pages/groups.dart';
import 'package:flutter/material.dart';


class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){


      case GroupsPages.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const GroupsPages(title: 'Categories',),
          // transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //   CurvedAnimation curved = CurvedAnimation(
          //       parent: animation,
          //       curve: Curves.fastOutSlowIn);
          //   Animation<double> anim =
          //   Tween<double>(begin: 0.0, end: 1.0).animate(curved);
          //   return ScaleTransition(
          //     scale: anim,
          //     child: FadeTransition(opacity: animation, child: child,),
          //   );
          // },
        );
      // case ArtistsPage.routeName:
      //   return PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //     const ArtistsPage(title: 'Artists Information',),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return FadeTransition(opacity: animation, child: child,);
      //     },
      //   );
      // case ArtistInformation.routeName:
      //   if(args != null && args is Map<String, ArtistData>){
      //     if(args['ArtistData']!=null){
      //       ArtistData data = args['ArtistData'] as ArtistData;
      //       return PageRouteBuilder(
      //         pageBuilder:(context, animation, secondaryAnimation) =>
      //             ArtistInformation(artistData: data,),
      //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //           return FadeTransition(opacity: animation, child: child,);
      //         },
      //       );
      //     } else {
      //       return _errorRoute();
      //     }
      //   } else {
      //     return _errorRoute();
      //   }
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
                    Navigator.of(context).pushNamed(GroupsPages.routeName);
                  },
                  child: const Center(
                    child: Text('Goto GroupsPages', style: TextStyle(color: Colors.blue)),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
      fullscreenDialog: true,
    );
  }
}

