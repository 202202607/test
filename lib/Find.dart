import 'package:flutter/material.dart';

class Find extends StatelessWidget{
  const Find({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Text(
          "Find",
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ),
    );
  }
}