import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/consts/colors_.dart';
import 'package:instagram_clone/consts/miscWidgets.dart';
import 'package:instagram_clone/screens/LoginScreen/LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  "assets/logo.png",
                  width: size.width / 2,
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      inkedButton(
                        size,
                        FontAwesomeIcons.facebook,
                        " Continue with Meta",
                        null,
                      ),
                      verticalSpaceWidget(),
                      dashedText(" OR ", size),
                      verticalSpaceWidget(),
                      // add inkwell if you need a feedback
                      Text(
                        "Sign Up with Email Address or Phone Number",
                        style: TextStyle(
                            color: blueColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Divider(
                        color: fadedColor.withOpacity(0.2),
                        thickness: 1,
                      ),
                      dualText("Already have an account? ", "Log in.",
                          const LoginScreen(), context, size),
                      verticalSpaceWidget(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
