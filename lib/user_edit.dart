import 'dart:core';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class user_edit extends StatefulWidget {
  @override
  _user_edit createState() => _user_edit();
}

class _user_edit extends State<user_edit> {
  TextEditingController name_Controller = TextEditingController();
  TextEditingController email_Controller = TextEditingController();
  TextEditingController phone_Controller = TextEditingController();
  TextEditingController age_Controller = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dob_Controller = TextEditingController();
  final GlobalKey<FormState> _product = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  XFile? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        dob_Controller.text = DateFormat.yMd().format(_selectedDate);
      });
    }
  }

  final AppBar _appbar = AppBar(
    backgroundColor: Colors.green,
    elevation: 0,
    title: const Text(
      "Edit your profile",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  _imgFromCamera() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = XFile(image!.path);
    });
  }

  _imgFromGallery() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image!;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final bar_height = _appbar.preferredSize.height;
    // final _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: _appbar,
          body: Form(
            key: _product,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: SizedBox(
                    height: bar_height + 70,
                    child: Stack(
                      children: [
                        _image != null
                            ? Positioned(
                                top: bar_height - 40,
                                left: _width / 2.5,
                                child: CircleAvatar(
                                    radius: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.file(
                                        File(_image!.path),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                              )
                            : Positioned(
                                top: bar_height - 40,
                                left: _width / 2.5,
                                child: CircleAvatar(
                                  radius: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      "assets/profile_1.png",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                        Positioned(
                            top: bar_height + 30,
                            left: _width / 1.7,
                            child: InkWell(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Image.asset(
                                "assets/camera_icon.png",
                                height: 30,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 25),
                  child: Row(
                    children: const [
                      Text(
                        "User Name *",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 25, left: 25),
                  child: TextFormField(
                    cursorColor: Colors.green,
                    onChanged: (value) {},
                    onTap: () {},
                    enabled: true,
                    controller: name_Controller,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD3D3D3).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter your Name",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 25),
                  child: Row(
                    children: const [
                      Text(
                        "Email *",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 25, left: 25),
                  child: TextFormField(
                    cursorColor: Colors.green,
                    onChanged: (value) {},
                    onTap: () {},
                    enabled: true,
                    controller: email_Controller,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD3D3D3).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter your Email",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 25),
                  child: Row(
                    children: const [
                      Text(
                        "phone*",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 25, left: 25),
                  child: TextFormField(
                    cursorColor: Colors.green,
                    onChanged: (value) {},
                    onTap: () {},
                    enabled: true,
                    controller: phone_Controller,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD3D3D3).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter phone number",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 25),
                  child: Row(
                    children: const [
                      Text(
                        "Date of Birth*",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 25, left: 25),
                  child: TextFormField(
                    cursorColor: Colors.green,
                    onChanged: (value) {},
                    onTap: () {
                      _selectDate(context);
                    },
                    enabled: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD3D3D3).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "DOB",
                      suffixIcon: const Icon(Icons.date_range),
                    ),
                    keyboardType: TextInputType.datetime,
                    controller: dob_Controller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 30),
                  child: Row(
                    children: const [
                      Text(
                        "Age*",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 25, left: 25),
                  child: TextFormField(
                    cursorColor: Colors.green,
                    onChanged: (value) {},
                    onTap: () {},
                    enabled: true,
                    controller: age_Controller,
                    maxLength: 3,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD3D3D3).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter Age",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "Gender :",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ChoiceChip(
                                    label: const Text("Male",
                                        style: TextStyle(fontSize: 16)),
                                    labelStyle: TextStyle(color: Colors.white),
                                    selectedColor: Colors.green,
                                    backgroundColor: Colors.grey,
                                    selected: true,
                                    onSelected: (selected) {},
                                  ),
                                  ChoiceChip(
                                    label: const Text("Female",
                                        style: TextStyle(fontSize: 16)),
                                    labelStyle:
                                        const TextStyle(color: Colors.white),
                                    selectedColor: Colors.green,
                                    backgroundColor: Colors.grey,
                                    selected: true,
                                    onSelected: (selected) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ]),
            ),
          )),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
