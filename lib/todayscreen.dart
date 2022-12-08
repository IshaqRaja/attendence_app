import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 32),
            child: Text("Welcome",
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "nexaregular",
                  fontSize: screenWidth / 20,
                )),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("Employee",
                style: TextStyle(
                  fontFamily: "Nexabold",
                  fontSize: screenWidth / 18,
                )),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 32),
            child: Text("Today's status",
                style: TextStyle(
                  fontFamily: "Nexabold",
                  fontSize: screenWidth / 18,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 32),
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 2),
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Check In",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: "nexaregular",
                          fontSize: screenWidth / 20,
                        )),
                    Text("09:30",
                        style: TextStyle(
                          fontFamily: "Nexabold",
                          fontSize: screenWidth / 18,
                        )),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Check Out",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: "nexaregular",
                          fontSize: screenWidth / 20,
                        )),
                    Text("--/--",
                        style: TextStyle(
                          fontFamily: "Nexabold",
                          fontSize: screenWidth / 18,
                        )),
                  ],
                )),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(
                  text: "11",
                  style: TextStyle(
                    color: primary,
                    fontSize: screenWidth / 20,
                    fontFamily: "Nexabold",
                  ),
                  children: [
                    TextSpan(
                      text: "Jan 2020",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth / 20,
                        fontFamily: "Nexabold",
                      )
                    )
                  ]
                ))
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("12:00:01 PM",
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "Nexabold",
                  fontSize: screenWidth / 18,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Builder(builder: (context) {
              final GlobalKey<SlideActionState> key = GlobalKey();
              return SlideAction(
                text: "Slide to Check Out",
                textStyle:  TextStyle(
                  color: Colors.black54,
                  fontSize: screenWidth / 20,
                  fontFamily: "nexaregular",
                ),
                outerColor: Colors.white,
                innerColor: primary,
                key: key,
                onSubmit: (){
                  key.currentState!.reset();
                },

              );
            }),
          )
        ],
      ),
    ));
  }
}
