import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  launchTest() async{
    launchUrl(
      Uri.parse("https://www.foodsafetykorea.go.kr/portal/board/board.do?menu_grp=MENU_NEW05&menu_no=3852"),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child:
          ElevatedButton(
            onPressed: () => {
              launchTest()
            },
            child: const Text("url test"),
        ),
      ),
    );
  }
}