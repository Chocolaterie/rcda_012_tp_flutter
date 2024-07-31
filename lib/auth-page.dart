import 'package:flutter/material.dart';
import 'package:rcda_012_tp_flutter/app-theme.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("mobile_background.jpg", fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                Image.asset("sign_in_icon.png", width: 126,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("Login", style: TextStyle(color: Color(0xDDFFFFFF), fontSize: 38),),
                ),
                AppTheme.wrapFormPadding(
                    TextField(decoration: AppTheme.fieldDecoration("Email", "Veuillez saisir un email"),)
                ),
                AppTheme.wrapFormPadding(
                    TextField(decoration: AppTheme.fieldDecoration("Password", "Veuillez saisir un mot de passe"),)
                ),
                AppTheme.wrapFormPadding(
                    Row(children: [
                      Switch(value: false, onChanged: (value) {}),
                      Text("Mémoriser mes informations", style: TextStyle(color: Color(0xFFFFFFFF)),)
                    ],)
                ),
                AppTheme.wrapFormPadding(
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () { }, child: Padding(
                        padding: const EdgeInsets.all(15.0),
                          child: Text('Submit'),
                        )))
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
