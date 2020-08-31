import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future dropdownDialog(
    BuildContext context,
    String title,
    List<String> choices,
  ) async {
    String choice = choices.first;
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DropdownButton<String>(
              hint: new Text("--"),
              value: choice == null ? null : choice,
              items: choices
                  .map((value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  })
                  .toSet()
                  .toList(),
              onChanged: (value) {
                setState(() {
                  choice = value;
                });
              },
            );
          }),
          actions: <Widget>[
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () =>
                  Navigator.of(context).pop([DialogAction.yes, choice]),
              child: Text(
                "Select",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : action;
  }
}
