import 'package:dinamik_not_ortalama/constants/app_const.dart';
import 'package:dinamik_not_ortalama/helper/data.dart';
import 'package:flutter/material.dart';

class Harfdropdown extends StatefulWidget {
  final Function onHarfSecildi;
  Harfdropdown({required this.onHarfSecildi, Key? key}) : super(key: key);

  @override
  _HarfdropdownState createState() => _HarfdropdownState();
}

class _HarfdropdownState extends State<Harfdropdown> {
  double secilenDeger = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: BorderRadius.circular(23),
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        value: secilenDeger,
        onChanged: (deger) {
          setState(() {
            secilenDeger = deger!;
            widget.onHarfSecildi(secilenDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}
