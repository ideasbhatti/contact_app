import 'package:contact_app/person.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPerson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Person'),
      ),
      body: ListView.builder(
        itemCount: listPerson.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listPerson[index].name.toString()),
            subtitle: Text(
              'Address: ' +
                  listPerson[index].address.toString() +
                  ', Email: ' +
                  listPerson[index].email.toString(),
            ),
            leading: Icon(Icons.add),
            // trailing: IconButton(Icons.phone),
            // onPressed: () {
            //   launch('tel:${listPerson[index].phone}');
            // },
            trailing: IconButton(
              onPressed: () {
                launch(
                  'tel:${listPerson[index].phone}',
                );
              },
              icon: Icon(Icons.phone),
            ),
          );
        },
      ),
    );
  }
}
