import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    key: _scaffoldKey,
    appBar: AppBar(
      title: Text("Abhinav MIS",style: TextStyle(color: Colors.white),),
      leading: IconButton(icon:Icon(Icons.menu),color: Colors.white,onPressed: ()=>_scaffoldKey.currentState?.openDrawer(),),
      backgroundColor: Colors.blue,
      ),
    drawer: new Drawer(child: SafeArea(child: Container(child: Text("Hello"),)),),
    body : SingleChildScrollView(
      child: Column(
        children:<Widget>[
          
        ]
      ),
    )
   );
  }

}