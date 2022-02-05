import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gmart_2/dashboard.dart';

import 'main.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: HeaderCurvedContainer(),
                  child: Container(
                    height: _height / 3.5,
                    // color: Colors.green,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: _width / 2.5,
                  child: Image.asset(
                    "assets/profile_1.png",
                    height: 90,
                  ),
                ),
                Positioned(
                    top: 180,
                    left: _width / 1.8,
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/camera_icon.png",
                        height: 30,
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Name*"),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 40.0),
              child: TextField(
                cursorColor: Colors.green,
                onChanged: (value) {},
                enabled: true,
                controller: nameController,
                textCapitalization: TextCapitalization.sentences,
                maxLength: 20,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(),
                  hintText: "name",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Who You Are"),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.green)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/tractor.png",
                                    fit: BoxFit.fill,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text("FARMER"),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.green)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/fertilizer.png",
                                    fit: BoxFit.fill,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text("FARMER"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.green)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/tractor.png",
                                    fit: BoxFit.fill,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text("FARMER"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.green)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/electric_motor.png",
                                    fit: BoxFit.fill,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text("FARMER"),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.green)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/crate.png",
                                    fit: BoxFit.fill,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text("FARMER"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  height: 50.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dashboard()),
                    );
                  },
                  color: Colors.green,
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
