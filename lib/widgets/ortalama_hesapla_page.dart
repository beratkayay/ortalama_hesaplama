import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama/constants/app_constant.dart';
import 'package:ortalama_hesaplama/helper/data_helper.dart';
import 'package:ortalama_hesaplama/model/ders.dart';
import 'package:ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:ortalama_hesaplama/widgets/harf_dropdown_widger.dart';
import 'package:ortalama_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:ortalama_hesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text(Sabitler.baslikText, style: Sabitler.baslikStyle,),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
  Row(
    children: [
      Expanded(
        flex: 2,
        child: _buildForm(),
  ),
  Expanded(
    flex: 1,
    child: OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length, ortalama: DataHelper.ortalamaHesapla()),
  ),
    ],
  ),
  Expanded(
    child: DersListesi(
      onDismiss: (index){
        DataHelper.tumEklenenDersler.removeAt(index);
        setState(() {
          
        });
      },
    ),
  ),



],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key:formKey, 
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: _buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),
                child: HarfDropdownWidget(
                  onHarfSecildi: (harf){
                    secilenHarfDegeri = harf;
                  },
                ),
                ),
              ),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),
                child: KrediDropdownWidget(onKrediSecildi: (kredi){
                  secilenKrediDegeri = kredi;
                }),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalama, 
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Colors.blueAccent,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField(){
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s){
        if(s!.length <= 0){
          return "Ders adını giriniz.";
        }else return null;
      },
      decoration: InputDecoration(
        hintText: "Matematik", 
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade200
        ),
    );
  }

  void _dersEkleveOrtalama() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(ad: girilenDersAdi, harfDegeri: secilenHarfDegeri, krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {
        
      });
    }
  }
}


