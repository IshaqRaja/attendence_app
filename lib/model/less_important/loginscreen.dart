import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();

  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color(0xffeef444c);

  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          isKeyboardVisible
              ? SizedBox(
                  height: screenHeight / 5, //15
                ) // use for pushing form to the upward direction when we use it
              : Container(
                  height: screenHeight / 4,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(70),
                      )
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: screenWidth / 5,
                    ),
                  ),
                ),

          ////////////////////////
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 50,
              bottom: screenHeight / 60,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: screenWidth / 15,
                fontFamily: "Nexabold",
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth / 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    "Employee Id",
                    style: TextStyle(
                      fontSize: screenWidth / 26,
                      fontFamily: "Nexabold",
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth / 15,
                        child: Icon(
                          Icons.person,
                          color: primary,
                          size: screenWidth / 15,
                        ),
                      ),
                      Expanded(
                          child: TextFormField(
                            enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight / 60,
                        ),
                          border: InputBorder.none,
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth / 26,
          fontFamily: "Nexaregular",
        ),
      ),
    );
  }

  Widget customfield(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            )
          ]),
      child: Row(
        children: [
          Container(
            width: screenWidth / 8,
            child: Icon(
              Icons.person,
              color: primary,
              size: screenWidth / 15,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(right: screenWidth / 12),
            child: TextFormField(
              controller: controller,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight / 35,
                ),
                border: InputBorder.none,
                hintText: hint,
              ),
              maxLines: 1,
              obscureText: obscure,
            ),
          ))
        ],
      ),
    );
  }
}
