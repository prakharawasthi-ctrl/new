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
  List<String> coursetype = <String>[
    'Mathematics 1',
    'Satistics 1',
    'Computational Thinking',
    'English 1',
    'Mathematics 2',
    'Statistics 2',
    'English 2',
    'Python',
  ];
  List<String> termtype = <String>[
    'Foundation level',
    'Diploma level',
    'Degree level'
  ];
  late String name;
  var selectedTerm, selectedTermType, selectedCourse, selectedCourseType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd5a54e),
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xffd5a54e)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
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
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                      this.name = name;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    "Select term:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 80)),
                    SizedBox(width: 30.0),
                    DropdownButton(
                      items: termtype
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (selectedTermType) {
                        print('$selectedTermType');
                        setState(() {
                          selectedTerm = selectedTermType;
                        });
                      },
                      value: selectedTerm,
                      isExpanded: false,
                      hint: Text(
                        'Choose Term Type',
                      ),
                    ),
                  ],
                ),
                // start of second dropdown
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    "Select Course:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 80)),
                    SizedBox(width: 30.0),
                    DropdownButton(
                      items: coursetype
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (selectedCourseType) {
                        print('$selectedCourseType');
                        setState(() {
                          selectedCourse = selectedCourseType;
                        });
                      },
                      value: selectedCourse,
                      isExpanded: false,
                      hint: Text(
                        'Choose course Type',
                      ),
                    ),
                  ],
                ),

                // end of second dreop down

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
                      child: Text("Register"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
