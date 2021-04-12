import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Runs the app
void main() {
  runApp(MyApp());
}

/// a stateless widget that will set the profile class as a home attribute
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile(),
    );
  }
}

/// This ensures that focus will not happen if this focusNode is assigned
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

/// the stateful widget of my app
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

/// controls the state of the app
class _ProfileState extends State<Profile> {
  //set up controllers and other variables
  final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();
  final _noFocus = AlwaysDisabledFocusNode();
  final _picker = ImagePicker();
  PickedFile _profilePicture;

  /// Retrieves an image from a given source
  Future _loadPicturePicker(ImageSource source) async {
    PickedFile image = await _picker.getImage(source: source);
    if (image != null) {
      setState(() {
        _profilePicture = image;
      });
    }
  }

  /// gives the user an option to pick from Gallery or camera
  void _pickPicture(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text("Pick from Gallery"),
                    onTap: () {
                      _loadPicturePicker(ImageSource.gallery);
                      //pops the alertDialog
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("Take a picture"),
                    onTap: () {
                      _loadPicturePicker(ImageSource.camera);
                      //pops the alertDialog
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ));
  }

  ///update _nameController and visuals
  void _nameChanged(text) {
    setState(() {
      _nameController.text =
          _firstNameController.text + " " + _lastNameController.text;
    });
  }

  /// update visuals
  void _textFieldChanged(text) {
    setState(() {});
  }

  /// the screen where the user can edit their name
  void _editNameScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      // gesture detector used to remove focus from keyboard or other input
      // field when tapping away from it
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Edit Name"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                child: Text(
                  "What's your name?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(3.0),
                      width: 175.0,
                      child: TextField(
                        controller: _firstNameController,
                        onChanged: _nameChanged,
                        decoration: InputDecoration(
                            labelText: "FirstName",
                            border: OutlineInputBorder()),
                      )),
                  Container(
                      width: 175.0,
                      child: TextField(
                        controller: _lastNameController,
                        onChanged: _nameChanged,
                        decoration: InputDecoration(
                            labelText: "LastName",
                            border: OutlineInputBorder()),
                      ))
                ],
              ),
            ],
          ),
        ),
      );
    }));
  }

  /// the screen where the user can edit their phone number
  void _editPhoneNumberScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      // gesture detector used to remove focus from keyboard or other input
      // field when tapping away from it
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Edit Phone"),
            ),
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                child: Text(
                  "What's your phone number?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Center(
                  child: Container(
                      padding: EdgeInsets.all(3.0),
                      width: 300.0,
                      child: TextField(
                          controller: _phoneController,
                          onChanged: _textFieldChanged,
                          decoration: InputDecoration(
                              labelText: "Your phone number",
                              border: OutlineInputBorder()))))
            ])),
      );
    }));
  }

  /// the screen where the user can edit their email
  void _editEmailScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      // gesture detector used to remove focus from keyboard or other input
      // field when tapping away from it
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Edit Email"),
            ),
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                child: Text(
                  "What's your email?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Center(
                  child: Container(
                      padding: EdgeInsets.all(3.0),
                      width: 300.0,
                      child: TextField(
                          controller: _emailController,
                          onChanged: _textFieldChanged,
                          decoration: InputDecoration(
                              labelText: "Your email address",
                              border: OutlineInputBorder()))))
            ])),
      );
    }));
  }

  /// the screen where the user can edit their bio
  void _editBio() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      // gesture detector used to remove focus from keyboard or other input
      // field when tapping away from it
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Edit Personal Story"),
            ),
            // single child scroll view to mitigate render flex issues.
            body: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: Text(
                    "What Type of Passenger are you?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Center(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                            minLines: 2,
                            maxLines: 6,
                            controller: _bioController,
                            onChanged: _textFieldChanged,
                            decoration: InputDecoration(
                                labelText: "Tell us about yourself",
                                border: OutlineInputBorder()))))
              ]),
            )),
      );
    }));
  }

  /// builds the profile page of the application
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //this Inkwell widget allows an onTap to be added where it otherwise
            //was not implemented.. in this case, for my stack
            InkWell(
              onTap: () {
                _pickPicture(context);
              },
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.blue[800],
                    child: CircleAvatar(
                        radius: 65,
                        backgroundImage: _profilePicture == null
                            ? AssetImage('images/emptyProfile.png')
                            : FileImage(File(_profilePicture.path))),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue[800],
                      ),
                    ),
                    bottom: 95,
                    right: 0,
                  ),
                ],
              ),
            ),
            TextField(
                controller: _nameController,
                onTap: _editNameScreen,
                focusNode: _noFocus,
                readOnly: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_forward_ios),
                    labelText: "Name")),
            TextField(
                controller: _phoneController,
                readOnly: true,
                onTap: _editPhoneNumberScreen,
                focusNode: _noFocus,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_forward_ios),
                    labelText: "Phone")),
            TextField(
                controller: _emailController,
                readOnly: true,
                focusNode: _noFocus,
                onTap: _editEmailScreen,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_forward_ios),
                    labelText: "Email")),
            TextField(
                controller: _bioController,
                readOnly: true,
                focusNode: _noFocus,
                onTap: _editBio,
                minLines: 1,
                maxLines: 6,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_forward_ios),
                    labelText: "Tell us about yourself")),
          ],
        ),
      ),
    );
  }
}
