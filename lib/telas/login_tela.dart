import 'package:celer_pesquisa_app/constantes.dart';
import 'package:celer_pesquisa_app/services/login_api.dart';
import 'package:celer_pesquisa_app/telas/recuperar_senha_tela.dart';
import 'package:celer_pesquisa_app/telas/iniciar_quiz_tela.dart';
import 'package:celer_pesquisa_app/utilidades/alert.dart';
import 'package:flutter/material.dart';

class LoginTela extends StatefulWidget {
  static const String id = 'login_tela';

  @override
  _LoginTelaState createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  // String email;
  // String password;
  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _textFormField(
    String label,
    String hint, {
    bool senha = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      style: kTextCorEscuro,
      controller: controller,
      validator: validator,
      obscureText: senha,
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

  String _validaSenha(String texto) {
    if (texto.isEmpty) {
      return "Digite o senha";
    }
    return null;
  }

  void _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    String login = _ctrlLogin.text;
    String senha = _ctrlSenha.text;

    print('login: $login senha: $senha');

    var userInfo = await LoginApi.login(login, senha);

    if (userInfo != null) {
      _navegaQuizStart(context);
    } else {
      alert(context, LoginTela.id, "Login Inválido!", 'Tente Novamente');
    }
  }

  _navegaQuizStart(BuildContext context) {
    Navigator.pushNamed(context, IniciarQuiz.id);
  }

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
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 48.0,
                  ),
                  _textFormField('Login', 'Digite o email',
                      controller: _ctrlLogin, validator: _validaLogin),
                  SizedBox(
                    height: 8.0,
                  ),
                  _textFormField('Senha', 'Digite a senha',
                      senha: true,
                      controller: _ctrlSenha,
                      validator: _validaSenha),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: kButtonCor1,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          //_clickButton(context);
                          Navigator.pushNamed(
                              context,
                              IniciarQuiz
                                  .id); // for testing when not using auth
                          //Login function bellow, only have to comment out
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Entrar',
                          style: kTextCorClaro,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: kButtonCor2,
                      borderRadius: BorderRadius.circular(30.0),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RecuperarSenhaTela.id);
                        },
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          'Esqueci a Senha',
                          style: kTextCorClaro,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
