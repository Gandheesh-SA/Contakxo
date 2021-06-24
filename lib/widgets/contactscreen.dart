import 'dart:math';
import 'package:contakxo/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {

  final Contacts contact;

  ContactCard({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: 30,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(20.0)),
          ),
          color: Color(Random().nextInt(0xffffffff))
              .withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ExpansionTile(

              title: Text(
                contact.name,
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.email,
                    style:
                    TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    contact.contactnumber.toString(),
                    style:
                    TextStyle(color: Colors.black),
                  ),
                ],
              ),
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Phone',
                        style: TextStyle(
                            color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            color: Colors.black),
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


