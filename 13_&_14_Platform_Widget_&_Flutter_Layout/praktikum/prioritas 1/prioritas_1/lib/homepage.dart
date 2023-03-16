import 'package:flutter/material.dart';
import 'package:prioritas_1/contact_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF303030),
        appBar: AppBar(
          backgroundColor: Color(0xFF424242),
          title: Text("MaterialApp"),
        ),
        drawer: Drawer(
          backgroundColor: Color(0xFF303030),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Text(
                  'Home',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              ListTile(
                title: Text(
                  'Setting',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Kontak kontak = listKontak[index];
              return Card(
                child: ListTile(
                  title: Text(
                    kontak.nama,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    kontak.num,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(
                      kontak.nama[0],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: listKontak.length,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF303030),
          selectedItemColor: Color(0xFF68e6ca),
          unselectedItemColor: Color(0xFF9d9d9d),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
