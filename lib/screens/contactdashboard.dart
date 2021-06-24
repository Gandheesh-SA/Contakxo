import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:contakxo/database/database.dart';
import 'package:contakxo/models/contacts.dart';
import 'package:contakxo/screens/contactdetailscreen.dart';
import 'package:contakxo/services/dateservice.dart';
import 'package:contakxo/services/timeservice.dart';
import 'package:contakxo/widgets/contactscreen.dart';
import 'package:flutter/material.dart';
import 'package:contakxo/constants/textStyles..dart';


class ContactDashBoard extends StatefulWidget {
  const ContactDashBoard({Key? key}) : super(key: key);

  @override
  _ContactDashBoardState createState() => _ContactDashBoardState();
}

class _ContactDashBoardState extends State<ContactDashBoard> {

  var textController = TextEditingController();

  String time = Time().formattedTime;
  String date = CurrentDate().complete;

  late List<Contacts> contacts;
  bool isLoading = false;


  @override
  void initState() {

    super.initState();
    refreshScreen();

  }




  Future refreshScreen() async {

    setState(() => isLoading = true);
    this.contacts = await ContactsDatabase.instance.readAllContacts();
    setState(() => isLoading = false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: ()  async {
          await showDialog(
              context: context, builder: (context) => ContactForm());
          refreshScreen();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 36.0,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 40, bottom: 30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                //color: Color(0xFF17096D),
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: headingOne,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    date,
                    style: headingTwo,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  AnimSearchBar(
                    helpText: 'Not Working',
                    width: 400,
                    textController: textController,
                    onSuffixTap: (){},
                  ),
                ],
              ),
            ),
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : contacts.isEmpty
                      ? Center(
                          child: Text('No contacts present', style: headingFour,),
                        )
                      : ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (_, index) {
                            final contact = contacts[index];

                            return ContactCard(contact: contact);
                          }),
            ),
          ],
        ),
      ),
    );
  }
}

