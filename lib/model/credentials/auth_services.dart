import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
   final  FirebaseAuth _auth;
  AuthService(this._auth);

  Stream<User?> get authStateChange => _auth.idTokenChanges();

  Future<Object> login(String email, String password) async { //?

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "logged In";
    } catch (e) {
      return e;     //e required convert String to Object
    }
  }

  Future<Object> signUp(String email, String password) async { //?

    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed Up";
    } catch (e) {
      return e;   //e required convert String to Object
    }
  }
}
