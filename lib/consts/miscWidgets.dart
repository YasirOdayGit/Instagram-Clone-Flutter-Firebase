import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/consts/colors_.dart';

SizedBox verticalSpaceWidget() {
  return const SizedBox(
    height: 20,
  );
}

SizedBox dualText(String first, String second, Widget? pushedWidget,
    BuildContext? context, Size size) {
  return SizedBox(
    width: size.width * 0.9,
    child: Align(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: first,
            style: TextStyle(color: fadedColor, fontWeight: FontWeight.bold),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: pushedWidget != null
                  ? () {
                      Navigator.push(
                          context!,
                          MaterialPageRoute(
                            builder: (context) => pushedWidget,
                          ));
                    }
                  : null,
              child: Text(
                second,
                style:
                    TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ])),
      ),
    ),
  );
}

Row dashedText(String text, Size size) {
  return Row(
    children: [
      Expanded(
          child: Divider(
        color: fadedColor.withOpacity(0.2),
        thickness: 2,
        indent: size.width * 0.05,
      )),
      Text(
        text,
        style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
      ),
      Expanded(
          child: Divider(
        color: fadedColor.withOpacity(0.2),
        thickness: 2,
        endIndent: size.width * 0.05,
      )),
    ],
  );
}

Ink inkedButton(
  Size size,
  IconData icon,
  String text,
  VoidCallback? callback,
) {
  return Ink(
    color: blueColor,
    height: 50,
    width: size.width * 0.9,
    child: InkWell(
      onTap: callback,
      child: FittedBox(
        // incase the phone font is really high which will make sure
        // that there will be no overflow
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: whiteColor,
            ),
            Text(
              text,
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
