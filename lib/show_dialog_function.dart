import 'package:flutter/material.dart';

Future<void> showDialogDart(BuildContext context, String response) {
  return showDialog(
    context: context,
    builder: (BuildContext ctx) => StatefulBuilder(
      builder: (BuildContext ctx, void Function(void Function()) setState) => AlertDialog(
        title: const Text('Number evaluated'),
        content: Text(response),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.pop(ctx);
              });
            },
            child: const Text('go back to main screen'),
          ),
        ],
      ),
    ),
  );
}
