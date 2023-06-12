import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
FirebaseAuth auth = FirebaseAuth.instance;

class SignIn {

   Future<bool> userSignIn(String email, String password) async{
     try {
       await auth.signInWithEmailAndPassword(
         email: email,
         password: password,
       );

     } catch(signUpError) {
       if(signUpError is PlatformException) {
         if(signUpError.code=='ERROR_EMAIL_ALREADY_IN_USE') {
           return false;
         }
       }

     }
   // (await auth.signInWithEmailAndPassword(
   //    email: email,
   //    password: password,
   //  );
     return true;

  }
}