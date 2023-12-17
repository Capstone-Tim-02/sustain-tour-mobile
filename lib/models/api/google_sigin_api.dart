import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSiginApi {
  static User? user = FirebaseAuth.instance.currentUser;

  static Future<User?> loginGoogle() async {
    final googleAccount = await GoogleSignIn().signIn();

    final googleAuth = await googleAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;
  }

  static Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
