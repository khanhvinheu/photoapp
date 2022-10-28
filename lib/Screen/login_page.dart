import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:photo_map/Component/loading_screen.dart';
import 'register_screen.dart';

class LoginPage extends StatelessWidget {
  final email = TextEditingController();
  String valueEmail = 'nhacungcap1@gmail.com';
  String valuePass = '123456';
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    email.text = valueEmail;
    password.text = valuePass;
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: SafeArea(
          child: Center(
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
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(150))),
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
              'PHOTO MAP',
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
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Email'),
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
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Password'),
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
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.amber),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: Text(
                    ' Register Now',
                    style: TextStyle(
                        color: Colors.blue[500], fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    ));
  }

  // void goToHomeScreen(context) => Navigator.of(context)
  //     .push(MaterialPageRoute(builder: (_) => HomeScreen()));
  void goToHomeScreen(context) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: ProgressIndicatorApp(),
        );
      },
    );
    var url = Uri.https(
        'quiet-reef-07659.herokuapp.com', '/api/admin/login', {'q': '{https}'});
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, body: {
      'email': email.text,
      'password': password.text,
      'remember': 'false'
    });
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse;
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => HomeScreen()));
      print('Data request: $itemCount.');
    } else {
      Navigator.pop(context, 'Cancel');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.redAccent,
            content:
                Text('Sai tài khoản hoặc mật khẩu! Vui lòng kiểm tra lại')),
      );
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
