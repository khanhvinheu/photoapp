import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_map/Screen/login_page.dart';
import 'home_screen.dart';
import 'login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:photo_map/Component/loading_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  final _formKey = GlobalKey<FormState>();
  final name_re = TextEditingController();
  final age_re = TextEditingController();
  final email_re = TextEditingController();
  final password_re = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: SafeArea(
          child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150))),
                    child: Center(
                      child: Icon(
                        Icons.maps_home_work_rounded,
                        size: 150,
                        color: Colors.white,
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'REGISTER PHOTO MAP',
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),
              SizedBox(
                height: 1,
              ),
              Text('Welcome, join my photo app now!'),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      controller: name_re,
                      obscureText: false,
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      controller: age_re,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Age'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      controller: email_re,
                      obscureText: false,
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextFormField(
                      controller: password_re,
                      obscureText: true,
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextButton(
                            child: Container(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.amber),
                            ),
                            // onPressed: () => goToHomeScreen(context),
                            onPressed: () {
                              Register(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextButton(
                            child: Container(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () => goToHomeScreen(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    ));
  }

  void Register(context) async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: ProgressIndicatorApp(),
          );
        },
      );
      // goToHomeScreen(context);

      var url = Uri.https('quiet-reef-07659.herokuapp.com',
          '/api/admin/register', {'q': '{https}'});
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(url, body: {
        'email': email_re.text,
        'password': password_re.text,
        "re_password": password_re.text,
        "hoTen": "fsdf",
        "dienThoai": '84484',
        "tinh": "Hà Nội",
        "huyen": "Bắc Từ Liêm",
        "xa": "Phường Cổ Nhuế 2",
        "diaChihome": "12",
        "diaChi": "12-Phường Cổ Nhuế 2-Bắc Từ Liêm-TP.Hà Nội"
      });

      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        var itemCount = jsonResponse;
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.amber, content: Text('Register success')),
        );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LoginPage()));
        print('Data request: $itemCount.');
      } else {
        Navigator.pop(context, 'Cancel');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('Register false!!')),
        );
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  void goToHomeScreen(context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => LoginPage()));
}
