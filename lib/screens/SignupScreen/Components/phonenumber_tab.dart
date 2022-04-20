import 'package:flutter/material.dart';
import 'package:instagram_clone/consts/colors_.dart';
import 'package:instagram_clone/consts/misc_widget.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final TextEditingController _phone = TextEditingController();

  refreshState() {
    setState(() {});
    print("lmaozy");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        verticalSpaceWidget(),
        SizedBox(
          width: size.width * 0.9,
          child: TextFormField(
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
              hintText: "Phone number",
              hintStyle: boldStyle.copyWith(color: fadedColor),
              fillColor: fieldColor,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              prefixIcon: GestureDetector(
                onTap: () async {
                  // select country code
                  await _showMaterialDialog(context, size, refreshState);
                  setState(() {
                    print("object");
                    print(countryCode);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(color: fadedColor))),
                  child: Text(
                    countryCode +
                        countriesList
                            .where((element) => element["code"] == countryCode)
                            .first["dial_code"]!,
                    style: boldStyle.copyWith(color: fadedColor),
                  ),
                ),
              ),
            ),
          ),
        ),
        verticalSpaceWidget(),
        Ink(
          width: size.width * 0.9,
          height: 50,
          color: _phone.text.trim().isNotEmpty
              ? blueColor
              : blueColor.withOpacity(0.5),
          child: InkWell(
            onTap: _phone.text.trim().isNotEmpty ? () {} : null,
            child: Align(
              child: Text(
                "Log In",
                style: boldStyle.copyWith(
                    color: _phone.text.trim().isNotEmpty
                        ? whiteColor
                        : whiteColor.withOpacity(0.5)),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Future<void> _showMaterialDialog(
    BuildContext context, Size size, VoidCallback function) async {
  final TextEditingController _search = TextEditingController();
  showDialog(
      context: context,
      builder: (_) => StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: blackColor,
              title: Text(
                'Select country code',
                style: boldStyle,
              ),
              content: SizedBox(
                height: size.height / 3,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: _search,
                      onChanged: (String x) {
                        setState(() {});
                        print("object");
                      },
                      keyboardType: TextInputType.text,
                      style: boldStyle.copyWith(color: whiteColor),
                      decoration: InputDecoration(
                        hintText: "Country code",
                        hintStyle: boldStyle.copyWith(color: fadedColor),
                        fillColor: fieldColor,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(12, 12, 0, 12),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 0, minHeight: 0),
                      ),
                    ),
                    verticalSpaceWidget(),
                    ...List.generate(
                        countriesList
                            .where((element) => element["name"]!
                                .toLowerCase()
                                .contains(_search.text..trim().toLowerCase()))
                            .length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  countryCode = countriesList
                                          .where((element) => element["name"]!
                                              .toLowerCase()
                                              .contains(_search.text))
                                          .elementAt(index)["code"] ??
                                      "IQ";
                                });
                                function();
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    countriesList
                                            .where((element) => element["name"]!
                                                .toLowerCase()
                                                .contains(_search.text))
                                            .elementAt(index)["name"]! +
                                        "  :  " +
                                        countriesList
                                            .where((element) => element["name"]!
                                                .toLowerCase()
                                                .contains(_search.text))
                                            .elementAt(index)["dial_code"]!,
                                    style: boldStyle,
                                  ),
                                ),
                              ),
                            ))
                  ],
                )),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Close',
                      style: boldStyle,
                    )),
              ],
            );
          }));
}
