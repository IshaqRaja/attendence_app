import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // AuthService authService = new AuthService();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login / SignUp"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "EMAIL....",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "PASSWORD....",
                ),
                obscureText: true,
              ),
            ),
            Container(
              child: ElevatedButton(onPressed:() {
                print(emailController.text);
                print(passwordController.text);
                // AuthService() auth = new AuthService();
// AuthService().login(emailController.text, passwordController.text);
                try {
                 firebaseAuth.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              }, child: Text("Login")),
            ),
            // Container(
            //   height: 40,
            //   width: MediaQuery.of(context).size.width / 3,
            //   color: Colors.blue,
            //   child: TextButton(
            //     onPressed: () {
            //       final String email = emailController.text.trim();
            //       final String password = passwordController.text.trim();
            //
            //       if (email.isEmpty) {
            //         print("Email is empty");
            //       } else {
            //         if (password.isEmpty) {
            //           print("password is empty");
            //         } else {
            //           context.read<AuthService>().login(email, password);
            //         }
            //       }
            //     },
            //     child: const Text(
            //       "Log In",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if (email.isEmpty) {
                    print("Email is empty");
                  } else {
                    if (password.isEmpty) {
                      print("password is empty");
                    } else {
                      context.read<AuthService>().signUp(
                        email,
                        password,
                      ).then((value) async {
                        User? user = FirebaseAuth.instance.currentUser; //9:18
                        await FirebaseFirestore.instance.collection("users").doc(user?.uid).set({
                          'udi': user?.uid,
                          'email': email,
                          'password': password,
                        });
                      });
                    }
                  }
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
