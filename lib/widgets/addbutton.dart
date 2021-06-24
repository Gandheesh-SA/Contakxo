import 'package:contakxo/database/database.dart';
import 'package:contakxo/models/contacts.dart';
import 'package:contakxo/services/databaseoperations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget addButton(
    GlobalKey<FormState> formkey,
    BuildContext context,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController numberController,
    Contacts ? c,
    bool validate,
    ){

  Future addContact() async{
    final contacts = Contacts(
      name: nameController.text,
      email: emailController.text,
      contactnumber: int.parse(numberController.text),
    );
    await ContactsDatabase.instance.create(contacts);
  }

  Future updateContact() async{
    final contacts = c!.copy(
      name: nameController.text,
      email: emailController.text,
      contactnumber: int.parse(numberController.text),
    );
    await ContactsDatabase.instance.update(contacts);
  }

  void addOrUpdate() async {
    if(validate){
      final isUpdating = c!=null;
      if(isUpdating){
        await updateContact();
      } else{
        await addContact();
      }
      Navigator.pop(context);
    }
  }
  return TextButton(
    child: Text(
      'Add',
      style: GoogleFonts.ubuntu(
        fontSize: 18.0,
        color: Colors.black,
      ),
    ),
    onPressed: () async {
      addOrUpdate();
    },
  );
}
