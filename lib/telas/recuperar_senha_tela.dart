import 'package:celer_pesquisa_app/constantes.dart';
import 'package:celer_pesquisa_app/services/password_reset.dart';
import 'package:celer_pesquisa_app/telas/bemvindo_tela.dart';
import 'package:celer_pesquisa_app/telas/login_tela.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/utilidades/popup.dart';

class RecuperarSenhaTela extends StatefulWidget {
  static const String id = 'recuperar_senha_tela';

  @override
  _RecuperarSenhaTelaState createState() => _RecuperarSenhaTelaState();
}

class _RecuperarSenhaTelaState extends State<RecuperarSenhaTela> {
  String emailValue;
  final _ctrlEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  PopupAlerta popup = PopupAlerta();

  _textFormField(
    String label,
    String hint, {
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      style: kTextCorEscuro,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: kButtonCor2,
          ),
          hintText: hint,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kButtonCor1, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kButtonCor1, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          )),
    );
  }

  String _validaLogin(String texto) {
    if (texto.isEmpty) {
      return 'Digite o email';
    }
    if (texto.length < 3) {
      return 'Email muito curto, insira novamente!';
    }
    return null;
  }

  void popUp() {
    Alert(
      context: context,
      style: AlertStyle(
        backgroundColor: Colors.white,
      ),
      title: "Concluido!",
      desc: "Verifique seu email para a troca da senha.",
      buttons: [
        DialogButton(
          child: Text(
            "Retornar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.popAndPushNamed(context, BemVindoTela.id),
          color: kButtonCor1,
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  // void _clickedResetButton(BuildContext context) async {
  //   bool formOk = _formKey.currentState.validate();
  //
  //   if (!formOk) {
  //     return;
  //   }
  //
  //   String email = _ctrlEmail.text;
  //
  //   print('login: $email');
  //
  //   var user = await PasswordReset.passwordReset(email);
  //
  //   if (user != null) {
  //     print('==> $user');
  //     popup.popUp(context, LoginTela.id, "Concluido!",
  //         "Verifique seu email para recuperar a sua senha.");
  //   } else {
  //     popup.popUp(context, RecuperarSenhaTela.id, "Erro!!",
  //         "Por favor, digite um email válido");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 50.0,
            color: kButtonCor2,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 48.0,
                ),
                _textFormField('Digite o seu email.', 'Digite o seu email',
                    controller: _ctrlEmail, validator: _validaLogin),
                // TextField(
                //   style: kTextCorEscuro,
                //   onChanged: (value) {
                //     emailValue = value;
                //   },
                //   decoration: InputDecoration(
                //     hintText: 'Digite o seu email.',
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: kButtonCor1, width: 1.0),
                //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: kButtonCor1, width: 2.0),
                //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: kButtonCor1,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        //emailValue --> contain the email typed in the textfield
                        //Implement recovering password functionality
                        setState(() {
                          //_clickedResetButton(context);
                          // if (emailValue == null) {
                          //   popup.popUp(context, RecuperarSenhaTela.id, "Erro!!",
                          //       "Por favor, digite um email válido");
                          // } else {
                          //   popup.popUp(context, BemVindoTela.id, "Concluido!",
                          //       "Verifique seu email para recuperar a sua senha.");
                          // }
                        });
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Recuperar Senha',
                        style: kTextCorClaro,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
