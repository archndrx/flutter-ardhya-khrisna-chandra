import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soal_app/model/contacts_model.dart';
import 'package:soal_app/provider/contact_provider.dart';

class UpdatePage extends StatefulWidget {
  final Contact contact;

  const UpdatePage({required this.contact});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late final TextEditingController _nameController;
  late final TextEditingController _numberController;
  late final TextEditingController _dateController;

  DateTime dueDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name);
    _numberController =
        TextEditingController(text: widget.contact.number.toString());
    _dateController = TextEditingController(text: widget.contact.date);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Number'),
            ),
            TextField(
              controller: _dateController,
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
                    _dateController.text =
                        DateFormat('dd-MM-yyyy').format(dueDate);
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Date',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedContact = Contact(
                  id: widget.contact.id,
                  name: _nameController.text,
                  number: int.parse(_numberController.text),
                  date: _dateController.text,
                  color: widget.contact.color,
                  file: widget.contact.file,
                );
                final contactProvider =
                    Provider.of<ContactProvider>(context, listen: false);
                contactProvider.updateContacts(updatedContact);
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
