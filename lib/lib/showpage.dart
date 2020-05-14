import  'package:flutter/material.dart';

// ignore: must_be_immutable
class Show extends StatefulWidget {
  String url;
  Show({Key key, @required this.url}) : super(key: key);
  @override
  _ShowState createState() => new _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Virus Corona"),
      ),
      body: Image.network(widget.url,width: double.infinity,),
    );
  }
}