import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_app/provider/contact_provider.dart';

import 'package:soal_app/screen/create_contact.dart';

import 'package:soal_app/screen/gallerypage.dart';
import 'package:soal_app/screen/login_page.dart';
import 'package:soal_app/screen/update_page.dart';

class HomePage extends StatefulWidget {
  final int? id;

  const HomePage({Key? key, this.id}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences loginData;
  String username = '';
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(username),
          actions: [
            IconButton(
              onPressed: () {
                loginData.setBool('login', true);
                loginData.remove('username');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Consumer<ContactProvider>(
          builder: (context, contactProvider, child) {
            final contacts = contactProvider.contacts;
            if (contactProvider.contacts.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum ada data'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6750A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            },
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return GalleryPage();
                            },
                          ),
                        );
                      },
                      child: Text("Open Gallery"),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        final contact = contacts[index];
                        String conColor = contact.color;
                        return Card(
                          color:
                              Color(int.parse(conColor.replaceAll('#', '0x'))),
                          child: ListTile(
                            title: Text(
                              contact.name,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact.number.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  contact.date,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundImage: FileImage(
                                File(
                                  contact.file.toString(),
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(pageBuilder: ((context,
                                          animation, secondaryAnimation) {
                                        return UpdatePage(
                                          contact: contact,
                                        );
                                      }), transitionsBuilder: (context,
                                          animation,
                                          secondaryAnimation,
                                          child) {
                                        final tween =
                                            Tween(begin: 0.0, end: 1.0);
                                        return ScaleTransition(
                                          scale: animation.drive(tween),
                                          child: child,
                                        );
                                      }),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    contactProvider.deleteContacts(contact.id!);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6750A4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return GalleryPage();
                          },
                        ),
                      );
                    },
                    child: Text("Open Gallery"),
                  ),
                ],
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                  pageBuilder: ((context, animation, secondaryAnimation) {
                return CreateContact();
              }), transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: 0.0, end: 1.0);
                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
              }),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
