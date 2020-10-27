import 'package:booking_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // creating a Firebase auth object

  // create user object based on FirebaesUser
  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
    //                        true               not true
  }

  // auth change user stream will hold a response wether their
  // is a user logged in or not.
  Stream<AppUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signinAnon() async {
    try {
      // ignore: omit_local_variable_types
      final UserCredential result = await _auth.signInAnonymously();
      final user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      // ignore: omit_local_variable_types
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: omit_local_variable_types
      final User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      // ignore: omit_local_variable_types
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // ignore: omit_local_variable_types
      final User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
