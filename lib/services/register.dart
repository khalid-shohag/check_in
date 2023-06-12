import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
FirebaseAuth auth = FirebaseAuth.instance;

class Register {

  static Future<bool> userRegistration(String email, String password) async{
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch(signUpError) {
      // if(signUpError is PlatformException) {
      //   if(signUpError.code=='auth/account-exists-with-different-credential') {
          return Future<bool>.value(false);
        // }
      // }

    }
    // (await auth.signInWithEmailAndPassword(
    //    email: email,
    //    password: password,
    //  );
    return Future<bool>.value(true);

  }
}