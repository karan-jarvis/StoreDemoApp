import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: 14.0,
    backgroundColor: Colors.black38,
    textColor: Colors.white,
  );
}

class DeleteDataPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete'),
      content: const Text('Are you sure you want to delete this data?'),
      actions: <Widget>[
        MaterialButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false); // Return false when canceled
          },
        ),
        MaterialButton(
          child: const Text('Delete'),
          onPressed: () {
            Navigator.of(context).pop(true); // Return true when confirmed
          },
        ),
      ],
    );
  }
}
