import 'package:assignment/api_service.dart';
import 'package:assignment/tabs.dart';
import 'package:assignment/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late User user;


  @override
  void initState() {
    super.initState();
    user = new User(email: '', password: '');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Login',
          style: GoogleFonts.openSans(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color(0xff1024ED),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/help.png',
              height: 25,
              width: 25,
              color: Color(0xff1024ED),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: globalFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter your e-mail address',
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: 260,
                    decoration: BoxDecoration(
                        color: Color(0xff1024ED).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) => !input!.contains("@")
                          ? "Email Id should be Valid"
                          : null,
                      onSaved: (input) => user.email = input!,
                      decoration: new InputDecoration(
                          prefixStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          labelText: "EMAIL ADDRESS",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 260,
                    decoration: BoxDecoration(
                        color: Color(0xff1024ED).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      cursorColor: Colors.white,

                      obscureText: true,
                      validator: (input) => input!.length < 3
                          ? "password should be more than 3 characters"
                          : null,
                      onSaved: (input) => user.password = input!,
                      decoration: new InputDecoration(
                          prefixStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (validateAndSave()) {
                        APIService apiService = new APIService();
                        apiService.login(user).then((value) => {
                          if(value.token.isNotEmpty){
                            print('logged in'),
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => TabBarDemo()),
                              (Route<dynamic> route) => false,
                        )
                          }else{
                    print(value.error)
                      }
                        });
                        print(user.toJson());
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xff1024ED),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Login/Register',
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'By proceeding, I agree to the',
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' Terms of use',
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
