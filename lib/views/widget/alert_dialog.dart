import 'package:flutter/material.dart';

Future<void> showMyDialog(context, Function() function) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete'),
        content: const Text('Delete this Note'),
        actions: <Widget>[
          TextButton(
            onPressed: function,
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            child: const Text('cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
