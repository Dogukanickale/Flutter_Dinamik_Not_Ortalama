import 'package:dinamik_not_ortalama/constants/app_const.dart';
import 'package:dinamik_not_ortalama/widget/ortalma_hesapla_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dinamik Ortalama Hesaplama",
      theme: ThemeData(
        primaryColor: Sabitler.anaRenk,
        visualDensity:
            VisualDensity.adaptivePlatformDensity, //diğer cihazlara uyumlu
      ),
      home: OrtalamaHesaplamaPage(),
    );
  }
}
