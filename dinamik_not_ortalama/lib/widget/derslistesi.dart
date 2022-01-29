import 'package:dinamik_not_ortalama/constants/app_const.dart';
import 'package:dinamik_not_ortalama/helper/data.dart';
import 'package:dinamik_not_ortalama/model/ders.dart';
import 'package:flutter/material.dart';

class Derslistesi extends StatelessWidget {
  final Function onElemancikarildi;
  const Derslistesi({required this.onElemancikarildi, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemancikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].kredidegeri)
                            .toStringAsFixed(1)),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].kredidegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            alignment: Alignment.center,
            child: Text(
              "LÜTFEN DERS EKLEYİNİZ",
              style: Sabitler.baslikStyle,
            ),
          );
  }
}

