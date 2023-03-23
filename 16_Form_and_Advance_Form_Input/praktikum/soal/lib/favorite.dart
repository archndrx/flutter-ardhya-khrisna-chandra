import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  DateTime dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color currentColor = Colors.orange;

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interactive Widget"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date"),
                    TextButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(currentDate.year + 5),
                        );
                        setState(() {
                          if (selectedDate != null) {
                            dueDate = selectedDate;
                          }
                        });
                      },
                      child: Text("Select"),
                    )
                  ],
                ),
                Text(
                  DateFormat('dd-MM-yyyy').format(dueDate),
                ),
              ],
            ),
            Column(
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
                      backgroundColor: MaterialStateProperty.all(currentColor),
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
            Column(
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
