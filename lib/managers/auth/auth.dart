
import 'package:brofinance/managers/auth/auth_exception.dart';
import 'package:brofinance/models/user_stg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {

  //MARK: init

  Auth._private();

  //MARK: properties

  static final shared = Auth._private();

  STGUser? user;

  //MARK: methods

  static void initialize() {
    Firebase.initializeApp(
      options: FirebaseOptions.fromMap(const {
        "apiKey": "AIzaSyAj2yOo2PBCgqVhvSkD-8qK4URpyWqn-Kc",
        "authDomain": "stg-backand.firebaseapp.com",
        "projectId": "stg-backand",
        "storageBucket": "stg-backand.appspot.com",
        "messagingSenderId": "1061121514543",
        "appId": "1:1061121514543:web:9a6d3fe36b8adaeafabada",
        "measurementId": "G-LGZQD1KBFL"
      })
    );
  }

  /// Throws Auth Exception
  Future signInWithEmailPassword(String email, String password) async {
    try {
      final userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      if (!userCred.user!.emailVerified) {
        throw STGAuthException(code: 1200, message: "Email not verified");
      }
      final userData = await FirebaseFirestore.instance.collection("Users").doc(
          userCred.user!.uid).get();
      user = STGUser.fromMap(userData.data()!);
    } on STGAuthException catch (_) {
      rethrow;
    } catch(e) {
      throw STGAuthException(code: 400, message: "Error in the login try again or check credentials");
    }

  }

  Future signUpWithEmailPassword(String email, String password) async {
    final userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    user = STGUser(email: email, equityInDollars: 222, uuid: userCred.user!.uid, name: "Test");
    FirebaseFirestore.instance.collection("Users").doc(user!.uuid).set(user!.toMap());
  }

}