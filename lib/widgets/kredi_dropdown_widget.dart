import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constant.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi; 
  const KrediDropdownWidget({required this.onKrediSecildi ,super.key});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
       decoration: BoxDecoration(
        color: Sabitler.anaRenk[200],
        borderRadius: Sabitler.borderRadius
       ),
       child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade300,
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            widget.onKrediSecildi(deger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri()
       ),
    );
  }
}