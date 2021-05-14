import 'package:flutter/material.dart';
import 'main.dart';
import 'SignIn.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
class login extends StatelessWidget {
  String _email, _password;
  FirebaseUser user;
  final emailTextController = TextEditingController();
  final passwordTextController= TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(15, 110, 0, 0.0),
                    child: Text('Hello',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold
                      ),)
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(90, 110, 0, 0.0),
                    child: Text('There',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold
                      ),)

                ),
                Container(
                    padding: EdgeInsets.fromLTRB(170, 90, 110, 0.0),
                    child: Text('.',
                      style: TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold,color: Colors.green
                      ),)

                )
              ],
            ),
          ),

          Container(
              padding: EdgeInsets.fromLTRB(15, 70, 0, 0),
              child:new  Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailTextController,
                        validator:(input){
                          if(input.isEmpty){
                            return 'Please enter Email Address';
                          }
                        },
                        onSaved: (input)=> _email =input,
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
                        validator:(input){
                          if(input.length <6){
                            return 'Your password need to be at least 6 characters';
                          }
                        },
                        onSaved: (input)=> _password =input,
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
                        obscureText: true,
                      ),
                      Container(
                        alignment: Alignment(1,0),
                        padding: EdgeInsets.only(top:15, right: 5, bottom: 20 ),
                        child: Text('Forgot Password',
                          style: TextStyle(
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
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
                                  //validateandsave();
                                 //FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password).then((user) {
                                   Navigator.push(context,MaterialPageRoute(builder: (context) => Signin() ));
                                 //}).catchError((e) => print(e));
                                },
                                child:Center(
                                  child: Text('Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),),
                                )
                            ),
                          )
                      ),
                      SizedBox(height: 20,),
                      Container(
                        // padding: EdgeInsets.only(top: 20),
                        height: 40,
                        width: 220,
                        child:Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.black
                              )
                          ),
                          child: GestureDetector(
                              onTap: (){
                              // LoginTest();

                                Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Center(

                                      child: Image(
                                        image: AssetImage('images/facebook.png'),
                                        height: 20,
                                      )
                                  ),
                                  Center(
                                    child: Text('Login with facebook',
                                      style: TextStyle(
                                          color: Colors.black
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),

                        ),


                        // )
                      )
                    ],
                  )
              )

          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('New to Spotify?'),
              SizedBox(width: 6),
              InkWell(
                onTap: (){
                  // Navigator.of(context).pushNamed('signup')
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                },
                child: Text('Register',
                  style: TextStyle(
                      decoration: TextDecoration.underline
                  ),),
              )
            ],
          )


        ],
      )

    );

  }
// Future<void> LoginTest() async{
// //  try{
// //    await FirebaseAuth.instance.
// //  }
// }
 
}
