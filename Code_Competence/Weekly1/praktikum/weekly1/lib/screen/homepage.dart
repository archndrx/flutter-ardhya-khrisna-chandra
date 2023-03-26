import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weekly1/model/data_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  GlobalKey<FormState> _keyNama = GlobalKey<FormState>();
  GlobalKey<FormState> _keyNomor = GlobalKey<FormState>();
  GlobalKey<FormState> _keyEmail = GlobalKey<FormState>();
  GlobalKey<FormState> _keyMessage = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bubbly Waves"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset('assets/banner.jpg'),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    'Welcome To',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Bubbly Waves',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            'Bubbly Waves is the best place for you to find amazing tourism sites in Bali. Just press the ',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'blue',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: ' button to get started.',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 284,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Start',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Need to get in touch with us? Either fill out the form with your inquiry or find the department email you'd like to contact below",
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFECF2FF),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  child: Form(
                                    key: _keyNama,
                                    child: TextFormField(
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Name',
                                        labelStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Nama harus diisi';
                                        }

                                        List<String> kata = value.split(' ');
                                        if (kata.length < 2) {
                                          return 'Masukkan nama lebih dari atau minimal 2 kata';
                                        }

                                        for (String words in kata) {
                                          if (!words
                                              .startsWith(RegExp('[A-Z]'))) {
                                            return 'Nama harus dimulai dengan kapital';
                                          }

                                          if (RegExp(
                                                  r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                              .hasMatch(words)) {
                                            return 'Nama tidak boleh mengandung angka atau karakter khusus';
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFECF2FF),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  child: Form(
                                    key: _keyNomor,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _numberController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Number',
                                        labelStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Nomor tidak boleh kosong';
                                        }
                                        if (RegExp(r'^[0-9]*$')
                                                .hasMatch(value) ==
                                            false) {
                                          return 'Nomor telepon harus terdiri dari angka saja';
                                        }
                                        if (value.length < 8 &&
                                            value.length > 15) {
                                          return 'Panjang nomor telepon harus 8-15 digit';
                                        }
                                        if (!value.startsWith('0')) {
                                          return 'Nomor telepon harus dimulai dengan angka 0';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFECF2FF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Form(
                              key: _keyEmail,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFECF2FF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Form(
                              key: _keyMessage,
                              child: TextFormField(
                                controller: _messageController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Message',
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Message tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_keyNama.currentState!.validate() &&
                              _keyNomor.currentState!.validate() &&
                              _keyEmail.currentState!.validate() &&
                              _keyMessage.currentState!.validate()) {
                            final name = _usernameController.text;
                            final number = _numberController.text;
                            final email = _emailController.text;
                            final message = _messageController.text;
                            showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  scrollable: true,
                                  title: Text(
                                    "Data Form",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  content: Text(
                                    'Name: ${name}\nNumber: ${number}\nEmail: ${email}\nMessage: \n${message}',
                                    textAlign: TextAlign.justify,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      child: Text('OK'),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                );
                              }),
                            );
                            _usernameController.clear();
                            _numberController.clear();
                            _emailController.clear();
                            _messageController.clear();
                          }
                        },
                        child: Text(
                          "Submit",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
