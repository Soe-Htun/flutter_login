import 'main.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
    );
  }
}

class SignPage extends StatefulWidget {
  SignPage({Key key}) : super(key: key);

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  int _value=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50),
            child: DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text("First Item"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Second Item"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Third Item"),
                  value: 3,
                ),
                DropdownMenuItem(
                  child: Text("Fourth Item"),
                  value: 4,
                )
              ],
              onChanged: (value){
                setState((){
                  _value=value;
                });

              },
            ),
          ),
          Container(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      //padding: EdgeInsets.only(top: 10),
                      height: 35,
                      width: 110,
                      child:Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.black
                            )
                        ),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                    child: Image(
                                      image: AssetImage('images/exit.png'),
                                      height: 20,
                                    )
                                ),
                                Center(
                                  child: Text('Logout',
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),

                      )
                  )
                ],
              )
          )
        ]



      )


    );
  }
}
