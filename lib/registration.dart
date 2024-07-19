import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/auth_service.dart';
import 'package:flutter_application_1/main.dart';

class Registration extends StatefulWidget{
  const Registration({super.key});
  @override
  State<Registration> createState() =>_Registration();
}

class _Registration extends State<Registration>{
  final TextEditingController txtusername=TextEditingController();
  final TextEditingController txtpassword=TextEditingController();


  void register_user() async{
    final message=await AuthService().Register(email: txtusername.text,password: txtpassword.text);
    if(message=="Success"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Successful!!!")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>MyHomePage()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check Username or password")));
    }
  }
@override
  Widget build(BuildContext context) {
   return Scaffold(
    body:SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Registration",style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),),
          Container(padding:EdgeInsets.only(left: 20.0,right: 20.0,top:25.0,bottom: 10.0),child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Username",style: TextStyle(fontSize: 20.0),),
              TextField(controller: txtusername,decoration: InputDecoration(hintText: "Username"),),
            ],
          )),
          Container(padding:EdgeInsets.only(left: 20.0,right: 20.0,top:25.0,bottom: 15.0),child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Password",style: TextStyle(fontSize: 20.0),),
              TextField(controller: txtpassword,decoration: InputDecoration(hintText: "Password"),obscureText: true,),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: InkWell(child: Text("Login..?",style: TextStyle(fontSize: 16.0,color: Colors.blueAccent),),onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>MyHomePage()));},),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: ElevatedButton(onPressed: (){register_user();}, child: Text("Register",style: TextStyle(fontSize: 18.0,color: Colors.black54),),style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent,padding: EdgeInsets.only(top:10.0,bottom:10.0,left: 20,right: 20.0))),
          ),
          

        ],
      ),
    ),
   );
  }
}