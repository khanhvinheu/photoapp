import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:photo_map/Component/loading_screen.dart';

class AlbumScreen extends StatefulWidget {
  final count = 0;
  const AlbumScreen({super.key});
  State<AlbumScreen> createState() => AlbumScreenSate();
}

class AlbumScreenSate extends State<AlbumScreen> {
  List<dynamic> data = [];
  @override
  void goToHomeScreen(context) async {
    var url = Uri.https(
        'quiet-reef-07659.herokuapp.com', '/api/admin/home', {'q': '{https}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      var itemCount = jsonResponse;
      setState(() {
        data = jsonResponse;
      });
      print('Data request: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Widget build(BuildContext context) {
    goToHomeScreen(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('ALBUMS'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Center(
                // child: Image(
                //   image: NetworkImage(
                //       'https://quiet-reef-07659.herokuapp.com//upload/sanpham/' +
                //           '${data[index]['hinhAnh']}'),
                // ),
                child: Image.network(
                    'https://quiet-reef-07659.herokuapp.com//upload/sanpham/' +
                        '${data[index]['hinhAnh']}'),
              ),
            );
          }),
      //     }),
    );
  }
}
