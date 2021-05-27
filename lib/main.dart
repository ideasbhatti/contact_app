import 'package:contact_app/person.dart';
import 'package:contact_app/person_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  clearAll() {
    _name.text = '';
    _address.text = '';
    _email.text = '';
    _phone.text = '';
  }

  // Dialogue Start
  _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text("Congratulations..."),
        content: new Text("Data Submited Successfully."),
        actions: <Widget>[
          MaterialButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  //End Dialogue Box

  final _keyForm = GlobalKey<FormState>();
  Person person = Person();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Data to System'),
      ),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              SizedBox(height: 10),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  prefixIcon: Icon(Icons.account_box),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Enter Your Name';
                  }
                  return null;
                },
                onSaved: (val) {
                  person.name = val;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _address,
                decoration: InputDecoration(
                  hintText: 'Enter Your Address',
                  prefixIcon: Icon(Icons.location_searching_outlined),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Enter Your Address';
                  }
                  return null;
                },
                onSaved: (val) {
                  person.address = val;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Enter Your Email';
                  }
                  return null;
                },
                onSaved: (val) {
                  person.email = val;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone',
                  prefixIcon: Icon(Icons.phone_rounded),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Enter Your Phone';
                  }
                  return null;
                },
                onSaved: (val) {
                  person.phone = val;
                },
              ),
              SizedBox(height: 40),
              MaterialButton(
                height: 35,
                color: Colors.orangeAccent,
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Person person1 = new Person();
                  person1.name = _name.text;
                  person1.address = _address.text;
                  person1.email = _email.text;
                  person1.phone = _phone.text;
                  if (_keyForm.currentState!.validate()) {
                    // Go Ahead
                    _keyForm.currentState!.save();
                    listPerson.add(person1);
                    _showMaterialDialog();
                    clearAll();
                  }
                },
              ),
              MaterialButton(
                height: 35,
                color: Colors.orangeAccent,
                child: Text(
                  'Preview',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPerson(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
