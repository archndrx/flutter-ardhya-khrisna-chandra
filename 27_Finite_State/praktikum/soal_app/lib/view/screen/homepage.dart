import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_app/core/enums/state.dart';
import 'package:soal_app/view/screen/food_page.dart';
import 'package:soal_app/viewmodel/provider/contact_provider.dart';

import 'package:soal_app/view/screen/create_contact.dart';

import 'package:soal_app/view/screen/gallerypage.dart';
import 'package:soal_app/view/screen/login_page.dart';
import 'package:soal_app/view/screen/update_page.dart';
import 'package:soal_app/model/api/contact_api.dart';

class HomePage extends StatefulWidget {
  final int? id;

  const HomePage({Key? key, this.id}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio dio = Dio();
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
    final contactProvider = Provider.of<ContactProvider>(context);
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
        body: contactProvider.state == ContactViewState.error
            ? CircularProgressIndicator()
            : Consumer<ContactProvider>(
                builder: (context, contactProvider, child) {
                  final contacts = contactProvider.contacts;
                  if (contactProvider.contacts.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Belum ada data'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                                      transitionDuration:
                                          Duration(milliseconds: 500),
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
                                          Animation<double>
                                              secondaryAnimation) {
                                        return GalleryPage();
                                      },
                                    ),
                                  );
                                },
                                child: Text("Open Gallery"),
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
                                      transitionDuration:
                                          Duration(milliseconds: 500),
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
                                          Animation<double>
                                              secondaryAnimation) {
                                        return FoodPage();
                                      },
                                    ),
                                  );
                                },
                                child: Text("Open Food Page"),
                              ),
                            ],
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
                                color: Color(
                                    int.parse(conColor.replaceAll('#', '0x'))),
                                child: ListTile(
                                  title: Text(
                                    contact.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            PageRouteBuilder(pageBuilder:
                                                ((context, animation,
                                                    secondaryAnimation) {
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
                                          contactProvider
                                              .deleteContact(contact.id!);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                    transitionDuration:
                                        Duration(milliseconds: 500),
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
                                    transitionDuration:
                                        Duration(milliseconds: 500),
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
                                      return FoodPage();
                                    },
                                  ),
                                );
                              },
                              child: Text("Open Food"),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          overlayOpacity: 0.4,
          children: [
            SpeedDialChild(
              child: Icon(Icons.add),
              backgroundColor: Color(0xFFECF2FF),
              label: 'Add Contact',
              onTap: () => Navigator.of(context).push(
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
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.print),
              backgroundColor: Color(0xFFECF2FF),
              label: 'Print Json',
              onTap: () async {
                final contactJson = await fetchContact();
                print(contactJson.id);
                print(contactJson.name);
                print(contactJson.phone);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.update),
              backgroundColor: Color(0xFFECF2FF),
              label: 'PUT Process',
              onTap: () async {
                final response = await updatePost();
                print(response.statusCode);
                print(response.data);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<ContactApi> fetchContact() async {
    final url =
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2';
    final response = await dio.get(url);
    final jsonMap = response.data;
    final contact = ContactApi.fromJson(jsonMap);
    return contact;
  }

  Future<Response> updatePost() async {
    final url = 'https://jsonplaceholder.typicode.com/posts/1';
    final response = await dio.put(url, data: {
      'userId': 1,
      'id': 1,
      'title': 'foo',
      'body': 'barr',
    });
    return response;
  }
}
