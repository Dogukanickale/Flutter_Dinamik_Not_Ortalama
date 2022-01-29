import 'package:dinamik_not_ortalama/constants/app_const.dart';
import 'package:flutter/material.dart';

class OrtalmaGoster extends StatelessWidget {
  final double ortalama;
  final int derssayisi;
  const OrtalmaGoster(
      {required this.derssayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          derssayisi > 0 ? "$derssayisi Ders Girildi" : "Ders Seçiniz",
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
        Text(ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.", // virgülden sonra 2 haneyi goster
            style: Sabitler.ortalamaStlye),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
      ],
    );
  }
}
