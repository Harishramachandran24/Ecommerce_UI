import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class showDetail extends StatefulWidget {
  const showDetail({Key? key}) : super(key: key);

  @override
  _showDetailState createState() => _showDetailState();
}

class _showDetailState extends State<showDetail> {
  AppBar _appbar = AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ))
    ],
  );
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final bar_height = _appbar.preferredSize.height;
    return Scaffold(
      appBar: _appbar,
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: _height - 150,
                  width: _width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 115.0),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                height: 50.0,
                                onPressed: () {},
                                color: Colors.lightBlueAccent,
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "+ Call",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 50.0,
                                onPressed: () {},
                                color: Colors.pink[300],
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.mail_outline,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Email",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 180,
                          width: _width - 20,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              shape: BoxShape.rectangle,
                              color: Colors.blueGrey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 180,
                                          width: 200,
                                          child: Image.asset(
                                            "assets/fruit.png",
                                            fit: BoxFit.fill,
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text("Product Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      SizedBox(height: 10),
                                      Text("50rs/kg",
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 5.0),
                                      Text("Coimbatore",
                                          style: TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 35.0, left: 25.0, right: 25.0, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Other Products",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  "See All",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.8,
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: Image.asset(
                                        "assets/fruit.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const Text("Name"),
                                    const Text("50rs/kg"),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: Image.asset(
                                        "assets/fruit.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text("Name"),
                                    Text("50rs/kg"),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: Image.asset(
                                        "assets/fruit.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text("Name"),
                                    Text("50rs/kg"),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: Image.asset(
                                        "assets/fruit.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text("Name"),
                                    Text("50rs/kg"),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: Image.asset(
                                        "assets/fruit.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text("Name"),
                                    Text("50rs/kg"),
                                  ],
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Positioned(
            top: bar_height - 150,
            left: _width / 2.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/profile_1.png")),
                  ],
                ),
              ],
            ),
            height: 200,
            // width: _width / 2,
          ),
          Positioned(
              top: bar_height + 50,
              left: _width / 25,
              height: 40,
              width: _width,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Flexible(
                      child: Text(
                        "Shop Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Flexible(child: Text("Coimbatore"))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
