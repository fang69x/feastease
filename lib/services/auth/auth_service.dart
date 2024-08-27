import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Get instance of FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      // Sign user in
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException errors
      throw Exception('Sign In Error: ${e.message}');
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred');
    }
  }

  // Sign up
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      // Sign user up
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException errors
      throw Exception('Sign Up Error: ${e.message}');
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      // Handle sign-out errors
      throw Exception('Sign Out Error: ${e.toString()}');
    }
  }
}
