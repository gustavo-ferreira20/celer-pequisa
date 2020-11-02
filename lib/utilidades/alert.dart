import 'package:celer_pesquisa_app/constantes.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Tente Novamente!',
            style: kTextCorEscuro2,
          ),
          content: Text(
            msg,
            style: kTextCorEscuro2,
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: kButtonCor1,
                ),
              ),
            )
          ],
        );
      });
}
