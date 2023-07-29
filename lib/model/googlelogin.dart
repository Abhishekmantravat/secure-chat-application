import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//  Future<User> signInWithGoogle() async {
//     // FirebaseAuth auth = FirebaseAuth.instance;

//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signIn();

//       final GoogleSignInAuthentication? googleSignInAuthentication =
//           await googleSignInAccount?.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication?.accessToken,
//         idToken: googleSignInAuthentication!.idToken,
//       );

//       try {
//         final UserCredential userCredential =
//             await auth.signInWithCredential(credential);

//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           // handle the error here
//         }
//         else if (e.code == 'invalid-credential') {
//           // handle the error here
//         }
//       } catch (e) {
//         // handle the error here
//       }
//       return null;

//   }





class GoogleLoginScreen extends StatefulWidget {
  @override
  _GoogleLoginScreenState createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    // Step 1: Initialize Google Sign-In
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      // Step 2: Get Google Sign-In Authentication
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Step 3: Create Firebase credential using the Google authentication token
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        // Step 4: Sign in to Firebase with the Google credential
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Step 5: Return the UserCredential
        return userCredential;
      } catch (e) {
        // Handle sign-in errors
        print("Error signing in with Google: $e");
        return null;
      }
    } else {
      // User canceled the Google Sign-in process
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signInWithGoogle().then((UserCredential? userCredential) {
              if (userCredential != null) {
                // Google sign-in successful, proceed to next screen or perform other actions
                print("Signed in with Google: ${userCredential.user?.displayName}");
              } else {
                // Google sign-in failed or user canceled
                print("Google sign-in failed or canceled.");
              }
            });
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}