import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/constantes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PopupAlerta {
  void popUp(
      BuildContext context, String displayTela, String title, String msg) {
    Alert(
      context: context,
      style: AlertStyle(
        backgroundColor: Colors.white,
      ),
      title: title,
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "Retornar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.popAndPushNamed(context, displayTela),
          color: kButtonCor1,
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }
}
