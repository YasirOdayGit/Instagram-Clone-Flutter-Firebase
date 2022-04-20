import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../consts/colors_.dart';
import '../../consts/miscWidgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  // toggle text visibility
  bool _showText = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Material(
        color: blackColor,
        child: Column(
          children: [
            Expanded(
                child: Scaffold(
              backgroundColor: blackColor,
              body: Form(
                key: _formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          width: size.width / 2,
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          child: TextFormField(
                            controller: _email,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Cannot be empty";
                              }

                              return null;
                            },
                            style: boldStyle.copyWith(color: whiteColor),
                            decoration: InputDecoration(
                              hintText:
                                  "Phone number, email address or username",
                              hintStyle: boldStyle.copyWith(color: fadedColor),
                              fillColor: fieldColor,
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(12, 12, 0, 12),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        verticalSpaceWidget(),
                        SizedBox(
                          width: size.width * 0.9,
                          child: TextFormField(
                            controller: _password,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _showText,
                            style: boldStyle.copyWith(color: whiteColor),
                            onChanged: (_) {
                              setState(() {});
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Cannot be empty";
                              }
                              if (value.trim().length < 6) {
                                return "Password too short";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle:
                                    boldStyle.copyWith(color: fadedColor),
                                fillColor: fieldColor,
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 12),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                alignLabelWithHint: true,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _showText = !_showText;
                                    });
                                  },
                                  icon: FaIcon(
                                    _showText
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    color: fadedColor,
                                  ),
                                )),
                          ),
                        ),
                        verticalSpaceWidget(),
                        // our own custom button because elevated isn't that good
                        Ink(
                          width: size.width * 0.9,
                          height: 50,
                          color: _email.text.trim().isNotEmpty &&
                                  _password.text.trim().isNotEmpty
                              ? blueColor
                              : blueColor.withOpacity(0.5),
                          child: InkWell(
                            onTap: _email.text.trim().isNotEmpty &&
                                    _password.text.trim().isNotEmpty
                                ? () {}
                                : null,
                            child: Align(
                              child: Text(
                                "Log In",
                                style: boldStyle.copyWith(
                                    color: _email.text.trim().isNotEmpty &&
                                            _password.text.trim().isNotEmpty
                                        ? whiteColor
                                        : whiteColor.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceWidget(),
                        dualText("Forgotten your login details? ",
                            "Get help with logging in.", null, context, size),
                        verticalSpaceWidget(),
                        dashedText(" OR ", size),
                        verticalSpaceWidget(),
                        inkedButton(size, FontAwesomeIcons.facebook,
                            " Continue with Meta", null),
                      ],
                    ),
                  ),
                ),
              ),
            )),
            // we are doing this to prevent the indent of this when soft keyboard
            // is shown
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              dualText(
                  "Don't have an account?", " Sign up.", null, context, size),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              verticalSpaceWidget(),
          ],
        ),
      ),
    );
  }
}
