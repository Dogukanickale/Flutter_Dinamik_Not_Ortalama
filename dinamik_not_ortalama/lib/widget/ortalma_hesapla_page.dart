import 'package:dinamik_not_ortalama/constants/app_const.dart';
import 'package:dinamik_not_ortalama/helper/data.dart';
import 'package:dinamik_not_ortalama/model/ders.dart';
import 'package:dinamik_not_ortalama/widget/derslistesi.dart';
import 'package:dinamik_not_ortalama/widget/harf_dropdown.dart';
import 'package:dinamik_not_ortalama/widget/kredi_dropdown.dart';
import 'package:dinamik_not_ortalama/widget/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplamaPage extends StatefulWidget {
  OrtalamaHesaplamaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplamaPageState createState() => _OrtalamaHesaplamaPageState();
}

class _OrtalamaHesaplamaPageState extends State<OrtalamaHesaplamaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenDeger = 4;
  double secilenkredideger = 1;
  String girilenDersAd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // yan cevirdiginde klavte cıkınca sıgmama hatası
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Form Olucak
          Row(children: [
            Expanded(
              flex: 2,
              child: _buildForm(),
            ),
            Expanded(
                flex: 1,
                child: OrtalmaGoster(
                    derssayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.OrtalamaHesaplama())),
          ]),
          //liste olucak
          Expanded(
            child: Derslistesi(
              onElemancikarildi: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _buildTextFormField(),
          ),
          SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Harfdropdown(
                  onHarfSecildi: (harf) {
                    secilenDeger = harf;
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: kredidropdown(
                  onkredisecildi: (kredi) {
                    secilenkredideger = kredi;
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: _dersekleveort,
              icon: Icon(Icons.arrow_forward_ios_sharp),
              color: Sabitler.anaRenk,
              iconSize: 30,
            )
          ])
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) => setState(() {
        girilenDersAd = deger!;
      }),
      validator: (s) {
        if (s!.length <= 0) {
          return " Ders Adını Giriniz !";
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: "Ders Adını Giriniz",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }

  _buildHarfler() {}

  _buildKrediler() {}

  void _dersekleveort() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAd,
          harfDegeri: secilenDeger,
          kredidegeri: secilenkredideger);
      DataHelper.dersEkle(eklenecekDers);
      print("$eklenecekDers");
      setState(() {});
    }
  }
}
