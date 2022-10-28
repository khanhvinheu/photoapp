import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:photo_map/Screen/login_page.dart';
import 'album_screen.dart';
import 'register_screen.dart';
import 'chart_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('PHOTO MAP'),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.map),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100))),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      'PHOTO MAP',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Hello: nhacungcap1'),
              leading: Image(
                image: NetworkImage(
                    'https://expresstours.files.wordpress.com/2015/07/minion.jpg'),
                height: 40,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginPage()));
              },
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 20,
              endIndent: 0,
              color: Colors.amber,
            ),
            ListTile(
              title: const Text('Login'),
              leading: Icon(Icons.account_box),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.key_rounded),
              title: const Text('Register'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => RegisterScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: const Text('Albums'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AlbumScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.add_chart),
              title: const Text('Chart'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ChartScreen()));
              },
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 20,
              endIndent: 0,
              color: Colors.amber,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Stack(children: <Widget>[
        new FlutterMap(
          options: MapOptions(
              center: LatLng(16.8372453, 105.9672083),
              zoom: 5.2,
              maxZoom: 18.2),
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
              onSourceTapped: null,
            ),
          ],
          children: [
            TileLayer(
              urlTemplate:
                  'https://mt0.google.com/vt/lyrs=y&hl=vi&x={x}&y={y}&z={z}',
              userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
