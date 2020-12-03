import 'package:flutter/material.dart';
import 'package:flutter_uiux/animations/animated_builder_page.dart';
import 'package:flutter_uiux/custom_painters/headers.dart';

import 'buttons/social_share/main_social_share_buttons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _openPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF457b9d),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFFe07a5f),
                  child: Text(
                    "Buttons",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _openPage(context, MainSocialShareButtons()),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  color: Color(0xFFe07a5f),
                  child: Text(
                    "Animations",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _openPage(context, AnimatedBuilderPage()),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  color: Color(0xFFe07a5f),
                  child: Text(
                    "Headers",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _openPage(context, HeadersPage()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
