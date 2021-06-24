import 'dart:math';
import 'package:contakxo/constants/textStyles..dart';
import 'package:contakxo/database/database.dart';
import 'package:contakxo/models/contacts.dart';
import 'package:contakxo/screens/contactdashboard.dart';
import 'package:flutter/material.dart';
import 'package:contakxo/services/callservice.dart';

class ContactCard extends StatefulWidget {

  final Contacts  contact;

  ContactCard({ required this.contact,});

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    CallService callService = CallService();
    return Padding(
        padding: EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: 30,
        ),
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(

            borderRadius:
            BorderRadius.all(Radius.circular(20.0)),
          ),
          color: Color(Random().nextInt(0xffffffff))
              .withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ExpansionTile(

              title: SelectableText(
                widget.contact.name,
                style: headingThree,
              ),
              subtitle: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    widget.contact.email,
                    style:
                    headingFive,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  SelectableText(
                    widget.contact.contactnumber.toString(),
                    style:
                    headingFive,
                  ),
                ],
              ),
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => callService.call(widget.contact.contactnumber.toString()),
                      child: Text(
                        'Phone',
                        style: headingFive,
                      ),
                    ),
                    TextButton(
                      onPressed: () => callService.email(widget.contact.email),
                      child: Text(
                        'Email',
                        style: headingFive,
                      ),
                    ),
                    TextButton(
                      onPressed: () => callService.sms(widget.contact.contactnumber.toString()),
                      child: Text(
                        'SMS',
                        style: headingFive,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await ContactsDatabase.instance.delete(widget.contact.id!);
                        Navigator.of(context).pop();
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ContactDashBoard()),);
                      },
                      child: Text(
                        'Delete',
                        style: headingFive,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}


