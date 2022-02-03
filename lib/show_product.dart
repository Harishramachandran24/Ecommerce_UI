import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class show_product extends StatefulWidget {
  const show_product({Key? key}) : super(key: key);

  @override
  _show_prouctState createState() => _show_prouctState();
}

class _show_prouctState extends State<show_product> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Card(
              elevation: 5.0,
              margin: EdgeInsets.zero,
              child: Container(
                height: _height / 3.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: _height / 3.5,
                            width: _width / 2.5,
                            child: GestureDetector(
                              onTap: (){
                                showAlertDialog(context);
                              },
                              child: Hero(
                                tag: "image",
                                child: Image.network(
                                    "https://4.imimg.com/data4/JB/PJ/MY-26160485/stim-rich-500x500.jpg"),
                              ),
                            ))
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 38.0, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "BioFit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text("by Harish"),
                                Text("Coimbatore"),
                                SizedBox(height: 15),
                                Text("Inorganic Fertilizer" ,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children:const [
                                       Padding(
                                        padding: EdgeInsets.all(18.0),
                                        child: Text("Rs 50/pack (Fixed Price)",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green)),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          height: 40.0,
                                          onPressed: () {},
                                          color: Colors.green,
                                          child: Row(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Buy Now",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actions: [
        Image.network("https://4.imimg.com/data4/JB/PJ/MY-26160485/stim-rich-500x500.jpg")
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
