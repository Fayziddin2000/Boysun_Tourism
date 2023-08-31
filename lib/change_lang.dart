import 'package:boysun_tourism/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

class ChangeLang extends StatefulWidget {
  const ChangeLang({Key? key}) : super(key: key);

  @override
  State<ChangeLang> createState() => _ChangeLangState();
}

enum Lang { uz, ru, en }

class _ChangeLangState extends State<ChangeLang> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(
          child: Text(
        'Change Lang'.tr,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
      )),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _itemLang(selectedLang: 'O\'zbekcha', photo: flagUz),
            _itemLang(selectedLang: 'Русский', photo: flagRu),
            _itemLang(selectedLang: 'English', photo: flagEn),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan,
                  ),
                  child: TextButton(
                    child: Text('Save'.tr,
                        style: const TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(navigatorKey.currentContext!).popUntil(
                        (route) => route.isFirst,
                      );
                      setState(
                        () async {
                          if (lang == 'uz') {
                            Get.updateLocale(Locale(lang!));
                          } else if (lang == 'ru') {
                            Get.updateLocale(Locale(lang!));
                          } else {
                            Get.updateLocale(Locale(lang!));
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemLang({required String selectedLang, photo}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(10)),
      child: RadioListTile(
        secondary: Image.asset(
          photo,
          height: 20,
          width: 40,
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(selectedLang),
        value: selectedLang,
        groupValue: selectedItem,
        onChanged: (value) async {
          setState(
            () {
              selectedItem = value!;
              if (selectedItem == 'O\'zbekcha') {
                lang = 'uz';
              } else if (selectedItem == 'Русский') {
                lang = 'ru';
              } else {
                lang = 'en';
              }
            },
          );
        },
      ),
    );
  }
}
