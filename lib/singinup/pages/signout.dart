import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //define method that interact with firebase auth
  //sigin anomonous
  //sigin with email and password
  //register with email and password
  //sign out

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}