import 'package:dinamik_not_ortalama/constants/app_const.dart';
import 'package:dinamik_not_ortalama/helper/data.dart';
import 'package:flutter/material.dart';

class kredidropdown extends StatefulWidget {
  final Function onkredisecildi;
  const kredidropdown({required this.onkredisecildi, Key? key})
      : super(key: key);

  @override
  State<kredidropdown> createState() => _kredidropdownState();
}

class _kredidropdownState extends State<kredidropdown> {
  double secilenkredideger = 1;
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
        value: secilenkredideger,
        onChanged: (hesap) {
          setState(() {
            secilenkredideger = hesap!;
            widget.onkredisecildi(hesap);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}
