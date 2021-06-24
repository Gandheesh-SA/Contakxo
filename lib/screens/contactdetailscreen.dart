import 'package:contakxo/models/contacts.dart';
import 'package:contakxo/widgets/addbutton.dart';
import 'package:contakxo/widgets/cancelbutton.dart';
import 'package:contakxo/widgets/emailfield.dart';
import 'package:contakxo/widgets/namefield.dart';
import 'package:contakxo/widgets/numberfield.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  final Contacts ? contact;

  ContactForm({this.contact});

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final formKey = GlobalKey<FormState>();
  final name=TextEditingController();
  final email = TextEditingController();
  var contactnumber = TextEditingController();
  late  bool validation= true;

  @override
  void initState() {
    super.initState();
    if(widget.contact!=null){

      final contact = widget.contact!;
      name.text = contact.name;
      email.text=contact.email;
      contactnumber.text= contact.contactnumber.toString();
      validation = formKey.currentState!.validate();

    }

  }

  @override
  Widget build(BuildContext context) {
    bool addOrEdit = widget.contact!=null;
    final heading = addOrEdit ? 'Edit Contacts': 'Add Contacts';
    return AlertDialog(
      title: Text(heading),
      content: Form(
        //key: formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              nameField(name),
              SizedBox(height: 20.0,),
              emailField(email),
              SizedBox(height: 20.0,),
              numberField(contactnumber),
            ]),
      ),
      actions: [
        addButton(formKey,context,name, email, contactnumber, widget.contact, validation),
        CancelButton(),
      ],
    );
  }
}


