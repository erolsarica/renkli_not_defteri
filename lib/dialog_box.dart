import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todoapp_yellow/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback kayitEt;
  VoidCallback iptalEt;

  DialogBox({
    super.key,
    required this.controller,
    required this.kayitEt,
    required this.iptalEt,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.yellow[300],
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // kullanıcıdan veri al
            TextField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Yeni Not Ekle",
              ),
            ),

            // kaydetme ve iptal etme butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // kaydet butonu
                MyButton(text: "Kaydet", onPressed:kayitEt),

                const SizedBox(width: 12,),

                // iptal butonu
                MyButton(text: "İptal", onPressed:iptalEt),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
