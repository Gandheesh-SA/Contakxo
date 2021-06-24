// To store data into database we'll define a table

final String tableContacts ='contacts';

// Column names of our database

class ContactFields{
   static final List<String> values =[
     id, name, email, contactnumber
   ];
   static final String id='_id';
   static final String name='name';
   static final String email='email';
   static final String contactnumber ='contactnumber';
}

// This is a model of what we'll be storing in our database

class Contacts {
   final int ? id;
   final String name;
   final String  email;
   final int  contactnumber;
   const Contacts({
     this.id, required this.name, required this.email,required this.contactnumber});

   // This method will help us to map the entries to the columns of the table

   Map<String, Object?> toJson() => {

      ContactFields.id: id,
      ContactFields.name: name,
      ContactFields.email: email,
      ContactFields.contactnumber: contactnumber,

   };

   // It creates a copy of our current contact object

   Contacts copy({
      int? id,
      String ? name,
      String ? email,
      int ? contactnumber,
   }) =>
      Contacts(
         id: id ?? this.id,
         name: name ?? this.name,
         email: email ?? this.email,
         contactnumber: contactnumber??  this.contactnumber
      );
   static Contacts fromJson(Map<String, Object?> json) => Contacts(
      id: json[ContactFields.id] as int?,
      name: json[ContactFields.name] as String,
      email: json[ContactFields.email] as String,
      contactnumber: json[ContactFields.contactnumber] as int,

   );
}

