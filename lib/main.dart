import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/auth_service.dart';
import 'package:flutter_application_1/database/db.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/registration.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState () => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final databasehelper=dbHelper.instance;

  final TextEditingController txtusername=TextEditingController();
  final TextEditingController txtpassword=TextEditingController();

  void check_password() async{
    //__this code is for sqflite checking
    // var abc=await databasehelper.getData();
    // if(txtusername.text==abc[0]["username"] && txtpassword.text==abc[0]["password"]){
    //   ScaffoldMessenger.of(this.context).showSnackBar(const SnackBar(content: Text("Login Sucessfully!!!")));
    //   Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (BuildContext content)=>Home()));
    // }
    // else{
    //         ScaffoldMessenger.of(this.context).showSnackBar(const SnackBar(content: Text("Login failed!!!")));
    // }
    final message= await AuthService().Login(email: txtusername.text, password: txtpassword.text);
    if(message=="Success"){
      ScaffoldMessenger.of(this.context).showSnackBar(const SnackBar(content: Text("Login Sucessfully!!!")));
      Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (BuildContext content)=>Home()));
    }
    else{
            ScaffoldMessenger.of(this.context).showSnackBar(const SnackBar(content: Text("Login failed!!!")));
    }
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue.shade300,
            child:Column(
            children: <Widget>[
              Expanded(child: Container(width: MediaQuery.of(context).size.width,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network("https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSWhyD9lXEe9cIaQlVINfylS8s25OY2g84uUx2o8pQcM2RbNs_F",
                    fit: BoxFit.fill,),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[
                      Text("Hello Student ",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                      Text("Sign In To Continue",style: TextStyle(color: Colors.white,fontSize: 20.0),)
                  ],),)
                ],
              ),),),
              Expanded(child: Container(decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),color: Colors.white),
              child:Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:10.0,bottom: 10.0,left: 40.0,right:40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          const Text("UserName",style: TextStyle(color: Colors.black54,fontSize: 18.0),),
                          TextField(controller:txtusername,decoration: InputDecoration(hintText: "Enter Username")),
                        ],
                      )),

                      Container(
                        padding: EdgeInsets.only(top: 25.0),
                        child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          const Text("Password",style: TextStyle(color: Colors.black54,fontSize: 18.0),),
                           TextField(controller:txtpassword,decoration: InputDecoration(hintText: "Enter Password"),obscureText: true,)
                        ],
                      )),

                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0),
                          height: 75,
                          width: 200,
                          child: ElevatedButton.icon(
                            onPressed: check_password, 
                            label: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),foregroundColor:Colors.white,backgroundColor: Colors.blue.shade900,),
                           
                            )

                          ),
                      ),

                      InkWell(child: Text("Registration..?",style: TextStyle(color: Colors.lightBlue),), onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext content)=>Registration()));},)

                  ],),
                ),
              )),)
            ],
          ),
          ),
      ),
    );
  }
}
