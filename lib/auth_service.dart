import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService{
  Future<String?> Login({required String email,required String password}) async{
    try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        return "Success";
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<String?> Register({required String email,required String password}) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    }
    catch(e){
      print(e.toString());
    }
  }
}