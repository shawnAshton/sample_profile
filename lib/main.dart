import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile(),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();
  final noFocus = AlwaysDisabledFocusNode();
  final _picker = ImagePicker();
  PickedFile _profilePicture;

  Future _loadPicturePicker(ImageSource source) async {
    PickedFile image = await _picker.getImage(source: source);
    if (image != null) {
      setState(() {
        _profilePicture = image;
      });
    }
    Navigator.pop(context);
  }

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
                    },
                  ),
                  ListTile(
                    title: Text("Take a picture"),
                    onTap: () {
                      _loadPicturePicker(ImageSource.camera);
                    },
                  )
                ],
              ),
            ));
  }

  //update nameController and visuals
  void _nameChanged(text) {
    setState(() {
      nameController.text =
          firstNameController.text + " " + lastNameController.text;
    });
  }

  //update visuals
  void _textFieldChanged(text) {
    setState(() {});
  }

  void _editNameScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
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
                      controller: firstNameController,
                      onChanged: _nameChanged,
                      decoration: InputDecoration(
                          labelText: "FirstName", border: OutlineInputBorder()),
                    )),
                Container(
                    width: 175.0,
                    child: TextField(
                      controller: lastNameController,
                      onChanged: _nameChanged,
                      decoration: InputDecoration(
                          labelText: "LastName", border: OutlineInputBorder()),
                    ))
              ],
            ),
          ],
        ),
      );
    }));
  }

  void _editPhoneNumberScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
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
                        controller: phoneController,
                        onChanged: _textFieldChanged,
                        decoration: InputDecoration(
                            labelText: "Your phone number",
                            border: OutlineInputBorder()))))
          ]));
    }));
  }

  void _editEmailScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
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
                        controller: emailController,
                        onChanged: _textFieldChanged,
                        decoration: InputDecoration(
                            labelText: "Your email address",
                            border: OutlineInputBorder()))))
          ]));
    }));
  }

  void _editBio() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Edit Personal Story"),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
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
                        controller: bioController,
                        onChanged: _textFieldChanged,
                        decoration: InputDecoration(
                            labelText: "Tell us about yourself",
                            border: OutlineInputBorder()))))
          ]));
    }));
  }

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
                            : FileImage(File(_profilePicture.path))
                        //_profilePicture == null ? AssetImage('images/shawnAshton.png') : FileImage(File(_profilePicture.path))
                        ),
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
                controller: nameController,
                onTap: _editNameScreen,
                focusNode: noFocus,
                readOnly: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_forward_ios),
                    labelText: "Name")),
            TextField(
                controller: phoneController,
                readOnly: true,
                onTap: _editPhoneNumberScreen,
                focusNode: noFocus,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_forward_ios),
                    labelText: "Phone")),
            TextField(
                controller: emailController,
                readOnly: true,
                focusNode: noFocus,
                onTap: _editEmailScreen,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_forward_ios),
                    labelText: "Email")),
            TextField(
                controller: bioController,
                readOnly: true,
                focusNode: noFocus,
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
