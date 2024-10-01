import 'package:flutter_firebase_app/Services/FirebaseAuthService/IFirebaseAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  @override
  Future<bool> createUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return false;
      } else if (e.code == 'email-already-in-use') {
        return false;
      } else {
        print({"Firebase Exception: ${e.message.toString()}"});
        return false;
      }
    } catch (ex) {
      print({"Exception: ${ex.toString()}"});
      return false;
    }
  }

  @override
  Future<bool> loginUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return false;
      } else if (e.code == 'wrong-password') {
        return false;
      } else {
        print({"Firebase Exception: ${e.message.toString()}"});
        return false;
      }
    } catch (ex) {
      print({"Exception: ${ex.toString()}"});
      return false;
    }
  }

  @override
  Future<bool> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      print({"Exception: ${e.message.toString()}"});
      return false;
    } catch (ex) {
      print({"Exception: ${ex.toString()}"});
      return false;
    }
  }
}
