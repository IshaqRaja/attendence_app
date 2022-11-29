import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController  = TextEditingController();

  double screenHeight = 0;
  double screenWidth = 0;
  Color primary = const Color(0xffeef444c);
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight / 2.5,
            width: screenWidth,
            decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(70),
                )),
            child: Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: screenWidth / 5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 15,
              bottom: screenHeight / 20,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: screenWidth / 18,
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
                fieldTitle("Employee ID"),
                customfield("Enter your employee Id", idController),
                fieldTitle("Password"),
                customfield("Enter your password", passController),
                Container(
                  height: 60,
                  width: screenWidth,
                  margin: EdgeInsets.only(top: screenHeight / 40),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child:  Center(
                    child: Text("LOGIN",
                    style: TextStyle(
                      fontFamily: "Nexabold",
                      fontSize: screenWidth / 26,
                      color: Colors.white

                    ),
                    ),
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

  Widget customfield(String hint, TextEditingController controller) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(bottom: 12),
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
                  controller:  controller,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight / 35,
                  ),
                  border: InputBorder.none,
                  hintText: hint,
            ),

          ),
              ))
        ],
      ),
    );
  }
}