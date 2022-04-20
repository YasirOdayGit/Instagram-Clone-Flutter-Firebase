import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/consts/colors_.dart';
import 'package:instagram_clone/consts/misc_widget.dart';

import 'Components/phonenumber_tab.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.userAstronaut,
                  size: size.width / 2,
                  color: whiteColor,
                ),
                verticalSpaceWidget(),
                SizedBox(
                  height: 200,
                  width: size.width * 0.9,
                  child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        backgroundColor: blackColor,
                        appBar: TabBar(
                          tabs: [
                            Tab(
                              child: Text(
                                "PHONE NUMBER",
                                style: boldStyle,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "EMAIL ADDRESS",
                                style: boldStyle,
                              ),
                            )
                          ],
                          indicatorColor: whiteColor,
                        ),
                        body: const TabBarView(
                            children: [PhoneNumberPage(), Text("2")]),
                      )),
                ),
                verticalSpaceWidget(),
                dashedText(" OR ", size),
                verticalSpaceWidget(),
                inkedButton(
                  size,
                  FontAwesomeIcons.facebook,
                  " Continue with Meta",
                  null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
