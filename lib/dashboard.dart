import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:gmart_2/search_store.dart';

import 'owner_detail.dart';

class CustomSliverAppbar extends StatefulWidget {
  @override
  _CustomSliverAppbarState createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
              ),
              backgroundColor: Colors.green,
              expandedHeight: 220.0,
              pinned: true,
              floating: true,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:28.0,right: 28.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Padding(
                              padding: EdgeInsets.only(left:40.0),
                              child: Text(
                                "25°C",
                                style: TextStyle(color: Colors.white, fontSize: 34),
                              ),
                            ),
                            IconButton(onPressed:(){}, icon: const Icon(Icons.notifications,),color: Colors.white,iconSize: 28,)
                          ],
                        ),
                      ),
                    ],
                  )),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 150,
                      left: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Ramanathapuram,",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                "Coimbatore.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Row(
                          //     children: const [
                          //       Text(
                          //         "25°C",
                          //         style: TextStyle(
                          //             color: Colors.white, fontSize: 34),
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: 40,
                      child: SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset(
                            "assets/sun.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 25.0,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => showDetail()),
                  );
                },
                child: SizedBox(
                  height: _height / 2,
                  width: _width - 45,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      shape:BoxShape.rectangle,
                      color: Colors.blueGrey.shade100,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/profile_1.png",
                                    height: 70,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text("Name"),
                                        Text("Coimbatore"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("days ago",style: TextStyle(color: Colors.black),),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:  [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:const [
                                      Text("Product name"),
                                      Text("Price"),
                                      Text("in Category"),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                child: SizedBox(
                                  height: _height / 4,
                                  width: _width - 100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shape:BoxShape.rectangle,
                                    ),
                                    child: Image.asset("assets/fruit.png",fit: BoxFit.fill,),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    IconButton(onPressed:(){}, icon: const Icon(Icons.favorite_outline_sharp)),
                                    IconButton(onPressed:(){}, icon: const Icon(Icons.comment_outlined))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => search_store()),
                  );
                },
                child: SizedBox(
                  height: _height / 2,
                  width: _width - 45,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      shape:BoxShape.rectangle,
                      color: Colors.blueGrey.shade100,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/profile_1.png",
                                    height: 70,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text("Name"),
                                        Text("Coimbatore"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children:const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("days ago",style: TextStyle(color: Colors.black),),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:  [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:const [
                                      Text("Product name"),
                                      Text("Price"),
                                      Text("in Category"),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                child: SizedBox(
                                  height: _height / 4,
                                  width: _width - 100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shape:BoxShape.rectangle,
                                    ),
                                    child: Image.asset("assets/fruit.png",fit: BoxFit.fill,),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    IconButton(onPressed:(){}, icon: const Icon(Icons.favorite_outline_sharp)),
                                    IconButton(onPressed:(){}, icon: const Icon(Icons.comment_outlined))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
