import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/consts/colors_.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    Ink(
                      color: blueColor,
                      height: 40,
                      width: size.width * 0.9,
                      child: InkWell(
                        onTap: () {},
                        child: FittedBox(
                          // incase the phone font is really high which will make sure
                          // that there will be no overflow
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                color: whiteColor,
                              ),
                              Text(
                                " Continue With Meta",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: fadedColor.withOpacity(0.2),
                          thickness: 2,
                          indent: size.width * 0.05,
                        )),
                        Text(
                          " OR ",
                          style: TextStyle(
                              color: whiteColor, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Divider(
                          color: fadedColor.withOpacity(0.2),
                          thickness: 2,
                          endIndent: size.width * 0.05,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                            color: fadedColor, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Log in.",
                        style: TextStyle(
                            color: whiteColor, fontWeight: FontWeight.bold),
                      ),
                    ])),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
