import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class Check extends StatelessWidget{
  const Check({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Checklist',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CheckList(title: 'temp'),
    );
  }
}

class CheckList extends StatefulWidget{
  const CheckList({super.key, required this.title});
  final String title;
  @override
  State<CheckList> createState()=>_CheckListState();
}

class _CheckListState extends State<CheckList>{

  static final List<String> _Allergy=[
    "메밀",
    "밀",
    "대두",
    "견과류",
    "육류",
    "갑각류",
    "복숭아",
    "토마토",
    "난류",
    "우유",
    "조개류",
    "굴, 전복, 홍합",
    "아황산류"
  ];
   List<bool>? _isChecked=List.filled(_Allergy.length, false);

   loadData() async{
    final SharedPreferences pref=await SharedPreferences.getInstance();
    List<bool> temp=List.filled(_Allergy.length, false);
    for(int i=0; i<_Allergy.length; i++){
      if(pref.getBool(_Allergy[i])!=null){
        temp[i]=pref.getBool(_Allergy[i])!;
      }else{}
    }
    setState(() {
      _isChecked=temp;
    });
  }

  void setData(String a, bool c) async{
    final SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool(a, c);
  }


  @override
  void initState(){
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: _Allergy.length,
          itemBuilder: (context, index){
            return Card(
            child: CheckboxListTile(
              title: Text(_Allergy[index], style: const TextStyle(fontSize: 20)),
              value: _isChecked![index],
              onChanged: (bool? value){
                setState(() {
                  if(value!=null){
                    _isChecked![index]=value;
                    setData(_Allergy[index], value);
                  }
                });
              },
            ),
            );
        },
        ),
      ),
    );
  }
}