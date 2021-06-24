import 'package:contakxo/database/database.dart';
import 'package:contakxo/models/contacts.dart';

Future addContact(String name, String email, int cn) async {
  final contact =Contacts(
      name: name,
      email: email,
      contactnumber: cn
  );
  await ContactsDatabase.instance.create(contact);
}

Future updateContact(Contacts c, String name, String email, int cn ) async {
  final contact = c.copy(
    name: name,
    email: email,
    contactnumber: cn
  );
  await ContactsDatabase.instance.create(contact);
}

void addOrUpdateContact(bool isValid,Contacts? c, String name, String email, int number ) async{
  if(isValid){
    final contacts = c !=null;
    if(contacts){
      await updateContact(c!, name, email, number);
    } else{
      await addContact(name, email, number);
    }
  }
}