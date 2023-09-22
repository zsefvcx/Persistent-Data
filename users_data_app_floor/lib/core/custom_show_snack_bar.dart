
import 'package:flutter/material.dart';

class CustomShowSnackBar {

  static void showSnackBar(String massage, BuildContext context){
    final snackBar = SnackBar(
      content: Text(massage),
      action: SnackBarAction(
        label: 'Ок',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
