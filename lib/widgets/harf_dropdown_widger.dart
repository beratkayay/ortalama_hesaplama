import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constant.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({required this.onHarfSecildi ,super.key});
  
  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  
double secilenHarfDegeri = 4;
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
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade300,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri()
       ),
    );
  }
}