// import 'dart:html';

// import 'dart:ui';

import 'package:flutter/material.dart';

class CreateProfilePage extends StatefulWidget {
  CreateProfilePage({Key? key}) : super(key: key);

  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final GlobalKey<FormState> createProfileKey = new GlobalKey<FormState>();
  late String name;
  String dropdownValue = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd5a54e),
      appBar: AppBar(
        title: Text(
          'Selection',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xffd5a54e)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.width * 1.5,
            decoration: BoxDecoration(
              color: Colors.amber[50],
              borderRadius: BorderRadius.circular(40),
            ),
            child: Form(
              key: createProfileKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 20),
                    child: Text(
                      "Full Name:",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffd5a54e),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffd5a54e)),
                        ),
                        hintText: "Keen Kumar",
                        // labelText: "Full Name"
                      ),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "full name is mendatory";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        // this.name = name;
                      },
                    ),
                  ),

                  // drop down ends here
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          "Select term:",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(20),
                          hint: Text('select'),
                          items: [
                            'Foundation level',
                            'Diploma level',
                            'Degree level'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          "Select Subject:",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(20),
                          hint: Text('select'),
                          items: [
                            'Mathematics 1',
                            'Satistics 1',
                            'Computational Thinking',
                            'English 1',
                            'Mathematics 2',
                            'Statistics 2',
                            'English 2',
                            'Python',
                          ].map((String nvalue) {
                            return DropdownMenuItem<String>(
                              value: nvalue,
                              child: Text(nvalue),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40, bottom: 40),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffd5a54e)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {
                          // todo add google signin logic
                          createProfileKey.currentState!.save();
                          createProfileKey.currentState!.validate();
                          print(name);
                        },
                        child: Text("Submit term and course"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
