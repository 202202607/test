import 'package:flutter/material.dart';
 import 'Home.dart';
import 'Check.dart';
import 'Find.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AllerView'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState()=>_MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController? controller;

  @override
  void initState(){
    super.initState();
    controller=TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[Home(), Check(), Find()],
      ),
      bottomNavigationBar: TabBar(tabs:const <Tab>[
        Tab(icon: Icon(Icons.home_filled), text: "홈 화면"),
        Tab(icon: Icon(Icons.account_box), text: "알레르기 체크",),
        Tab(icon: Icon(Icons.add_a_photo_outlined), text: "식품 검색",)
      ],
      controller: controller),
    );
  }
}
