import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:soal_app/model/contacts_model.dart';
import 'package:soal_app/provider/contact_provider.dart';

import 'package:soal_app/screen/gallerypage.dart';

class CreateContact extends StatefulWidget {
  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  final namaController = TextEditingController();
  final nomorController = TextEditingController();
  final dateController = TextEditingController();
  final fileController = TextEditingController();

  GlobalKey<FormState> _keyNama = GlobalKey<FormState>();
  GlobalKey<FormState> _keyNomor = GlobalKey<FormState>();

  DateTime dueDate = DateTime.now();

  Color currentColor = Colors.orange;

  Future<void> _pickFiles() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (pickedFile != null) {
      print(pickedFile.files.single.path);

      setState(() {
        fileController.text = pickedFile.files.single.path!;
      });
    } else {
      print("File is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF6200EE),
          title: Text("Contacts"),
        ),
        body: SingleChildScrollView(
          //TAMPILAN AWAL
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: SizedBox(
                  width: 398,
                  height: 172,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_android_outlined,
                        size: 22,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text(
                        "Create New Contacts",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Text(
                                "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 1,
                                color: Color.fromARGB(255, 219, 215, 215),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7E0EC),
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Form(
                        key: _keyNama,
                        child: TextFormField(
                          controller: namaController,
                          decoration: const InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Color(0xFF49454F),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: 'Insert Your Name',
                              hintStyle: TextStyle(
                                color: Color(0xFF49454F),
                              ),
                              disabledBorder: InputBorder.none,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama harus diisi';
                            }

                            List<String> kata = value.split(' ');
                            if (kata.length < 2) {
                              return 'Masukkan nama lebih dari ata minimal 2 kata';
                            }

                            for (String words in kata) {
                              if (!words.startsWith(RegExp('[A-Z]'))) {
                                return 'Nama harus dimulai dengan kapital';
                              }

                              if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
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
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7E0EC),
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Form(
                        key: _keyNomor,
                        child: TextFormField(
                          controller: nomorController,
                          decoration: const InputDecoration(
                              labelText: 'Number',
                              labelStyle: TextStyle(
                                color: Color(0xFF49454F),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              hintText: '08 ...',
                              hintStyle: TextStyle(
                                color: Color(0xFF49454F),
                              ),
                              disabledBorder: InputBorder.none,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nomor tidak boleh kosong';
                            }
                            if (RegExp(r'^[0-9]*$').hasMatch(value) == false) {
                              return 'Nomor telepon harus terdiri dari angka saja';
                            }
                            if (value.length < 8 || value.length > 15) {
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
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7E0EC),
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: TextField(
                        controller: dateController,
                        readOnly: true,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: dueDate,
                            firstDate: DateTime(1990),
                            lastDate: DateTime(dueDate.year + 5),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              dueDate = selectedDate;
                              dateController.text =
                                  DateFormat('dd-MM-yyyy').format(dueDate);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Date',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7E0EC),
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Color"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 100,
                            width: double.infinity,
                            color: currentColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(currentColor),
                              ),
                              child: Text("Submit"),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Pick Your Color"),
                                        content: BlockPicker(
                                          pickerColor: currentColor,
                                          onColorChanged: (color) {
                                            setState(() {
                                              currentColor = color;
                                            });
                                          },
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Save"),
                                          )
                                        ],
                                      );
                                    });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7E0EC),
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pick Files"),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  _pickFiles();
                                },
                                child: Text("Pick and Open Files"),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              //TOMBOL SUBMIT
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6750A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        if (_keyNama.currentState!.validate() &&
                            _keyNomor.currentState!.validate()) {
                          final name = namaController.text;
                          final number = nomorController.text;
                          final date = dateController.text;
                          final file = fileController.text;
                          final color = currentColor;

                          final contactProvider = Provider.of<ContactProvider>(
                              context,
                              listen: false);
                          contactProvider.addContact(
                              name, number, date, color, file);
                          print(contactProvider.contacts);
                          Navigator.pop(context);

                          // setState(() {
                          //   listContacs.add([
                          //     namaController.text,
                          //     nomorController.text,
                          //     dateController.text,
                          //     currentColor,
                          //     fileController.text,
                          //   ]);
                          //   namaController.clear();
                          //   nomorController.clear();
                          //   dateController.clear();
                          //   print(listContacs);
                          // });
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Center(
              //   child: Text(
              //     "List Contacts",
              //     style: const TextStyle(
              //         fontSize: 24, fontWeight: FontWeight.w400),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // //TAMPILAN LIST KONTAK
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 8,
              //     right: 8,
              //     bottom: 8,
              //   ),
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.vertical,
              //     itemCount: listContacs.length,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemBuilder: (BuildContext context, int index) {
              //       return Card(
              //         color: listContacs[index][3],
              //         child: ListTile(
              //           title: Text(
              //             listContacs[index][0],
              //             style: const TextStyle(
              //               fontSize: 18,
              //             ),
              //           ),
              //           subtitle: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 ("${listContacs[index][1]}"),
              //                 style: const TextStyle(
              //                   fontSize: 14,
              //                 ),
              //               ),
              //               Text(
              //                 ("${listContacs[index][2]}"),
              //                 style: const TextStyle(
              //                   fontSize: 12,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           leading: CircleAvatar(
              //             backgroundImage: FileImage(
              //               File(listContacs[index][4]),
              //             ),
              //           ),
              //           trailing: Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               IconButton(
              //                 onPressed: () {
              //                   showDialog(
              //                     context: context,
              //                     builder: (BuildContext context) {
              //                       TextEditingController uNamaController =
              //                           TextEditingController(
              //                               text: listContacs[index][0]);
              //                       TextEditingController uNomorController =
              //                           TextEditingController(
              //                               text: listContacs[index][1]);
              //                       return AlertDialog(
              //                         title: Text('Update Contacts'),
              //                         content: Column(
              //                           mainAxisSize: MainAxisSize.min,
              //                           children: [
              //                             TextField(
              //                               controller: uNamaController,
              //                               decoration: InputDecoration(
              //                                   hintText: 'Masukkan nama'),
              //                             ),
              //                             TextField(
              //                               controller: uNomorController,
              //                               decoration: InputDecoration(
              //                                   hintText: 'Masukkan nomor'),
              //                             ),
              //                           ],
              //                         ),
              //                         actions: [
              //                           TextButton(
              //                             onPressed: () {
              //                               setState(() {
              //                                 listContacs[index][0] =
              //                                     uNamaController.text;
              //                                 listContacs[index][1] =
              //                                     uNomorController.text;
              //                               });
              //                               Navigator.pop(context);
              //                             },
              //                             child: Text('Update'),
              //                           ),
              //                         ],
              //                       );
              //                     },
              //                   );
              //                 },
              //                 icon: Icon(Icons.edit),
              //               ),
              //               IconButton(
              //                 onPressed: () {
              //                   setState(() {
              //                     listContacs.removeAt(index);
              //                   });
              //                 },
              //                 icon: const Icon(
              //                   Icons.delete,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
