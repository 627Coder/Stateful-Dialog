import 'package:flutter/material.dart';
import 'package:statefuldialog/dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DialogPage(),
    );
  }
}

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  String selectedchoice = "Click me";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dialog With dropdown"),
        ),
        body: Center(
          child: Container(
              child: RaisedButton(
                  child: Text(selectedchoice),
                  onPressed: () async {
                    final action = await Dialogs.dropdownDialog(context,
                        "Please select a choice", ["good", "bad", "Awsome"]);

                    if (action[0] == DialogAction.yes) {
                      setState(() {
                        selectedchoice = action[1];
                      });
                    }
                  })),
        ));
  }
}
