import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Signup extends StatelessWidget {
  String _email, _password;
  final emailTextController = TextEditingController();
  final passwordTextController= TextEditingController();
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
      children: <Widget>[
      Container(
      padding: EdgeInsets.fromLTRB(15, 70, 0, 0),
        child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller:emailTextController ,
                  decoration: InputDecoration(
                      labelText: 'Emaill',
                      labelStyle:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      )
                  ),
                ),

                TextFormField(
                  controller: passwordTextController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green
                          )
                      )
                  ),
                ),
                SizedBox(height: 40),
                Container(
                    height: 40,
                    width: 220,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.green,
                      color: Colors.green,
                      elevation: 10,

                      child: GestureDetector(
                          onTap: (){
                            signUp();
                            //Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp() ));
                          },
                          child:Center(
                            child: Text('Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),),
                          )
                      ),
                    )
                ),
              ],
            )
        )

    )
    ]
    )
    );
  }
  Future<void> signUp() async{
    final FirebaseAuth _auth= FirebaseAuth.instance;
    try{
       await _auth.signInWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);
      showDialog(context: context,
      builder: (context){
        return AlertDialog(
          content: Text('Successful sign up'),
        );
      });
    }catch(e){
      print(e.message);
      showDialog(context: context,builder: (context){
        return AlertDialog(
          content: Text(e.message),
        );
      });
    }
  }
}
