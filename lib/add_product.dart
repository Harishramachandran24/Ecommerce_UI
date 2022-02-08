import 'dart:core';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Add_product extends StatefulWidget {
  const Add_product({Key? key}) : super(key: key);

  @override
  _Add_productState createState() => _Add_productState();
}

class _Add_productState extends State<Add_product> {
  TextEditingController category_Controller = TextEditingController();
  TextEditingController price_Controller = TextEditingController();
  TextEditingController product_name_Controller = TextEditingController();
  TextEditingController quantity_Controller = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController date_availableController = TextEditingController();
  TextEditingController description_Controller = TextEditingController();
  final GlobalKey<FormState> _product = GlobalKey<FormState>();
  List sub_category = ["fruits", "vegetables", "seeds", "fertilizers"];
  List product_category = ["Banana", "Apple", "Rice", "Urea"];
  late String Selected_category_id = "";
  late String Selected_product_id = "";
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        date_availableController.text = DateFormat.yMd().format(_selectedDate);
      });
    }
  }

  _showSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      // set this to true
      builder: (_) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            minChildSize: 0.2,
            // 0.1 times of available height, sheet can't go below this on dragging
            maxChildSize: 0.8,
            initialChildSize: 0.4,
            expand: false,
            builder: (_, controller) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            " Select Category",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, right: 50.0, left: 50),
                    child: SingleChildScrollView(
                      child: Column(
                          children: sub_category
                              .map((e) => Column(children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Selected_category_id = e;
                                          category_Controller.text = e;
                                        });
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(e,
                                                  style: const TextStyle(
                                                      fontSize: 15)),
                                            ),
                                            Selected_category_id == e
                                                ? const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Icon(Icons.check,
                                                        color: Colors.green),
                                                  )
                                                : const SizedBox.shrink(),
                                          ]),
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                    ),
                                  ]))
                              .toList()),
                    ),
                  ),
                ],
              );
            },
          );
        });
      },
    );
  }

  _showProductSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      // set this to true
      builder: (_) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            minChildSize: 0.2,
            // 0.1 times of available height, sheet can't go below this on dragging
            maxChildSize: 0.8,
            initialChildSize: 0.4,
            expand: false,
            builder: (_, controller) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            " Select Category",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, right: 50.0, left: 50),
                    child: SingleChildScrollView(
                      child: Column(
                          children: product_category
                              .map((e) => Column(children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Selected_product_id = e;
                                          product_name_Controller.text = e;
                                        });
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(e,
                                                  style: const TextStyle(
                                                      fontSize: 15)),
                                            ),
                                            Selected_product_id == e
                                                ? const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Icon(Icons.check,
                                                        color: Colors.green),
                                                  )
                                                : const SizedBox.shrink(),
                                          ]),
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                    ),
                                  ]))
                              .toList()),
                    ),
                  ),
                ],
              );
            },
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            title: const Text(
              "Add Your Product Here",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: Form(
            key: _product,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 25),
                  child: Row(
                    children: const [
                      Text(
                        "Select Category *",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 25, left: 25),
                  child: TextFormField(
                    readOnly: true,
                    cursorColor: Colors.green,
                    onChanged: (value) {},
                    onTap: () {
                      _showSheet();
                    },
                    enabled: true,
                    controller: category_Controller,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.arrow_drop_down_outlined,
                          color: Colors.black),
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
                      hintText: "Select Product Category",
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
                        "Product Name *",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 25, left: 25),
                  child: TextFormField(
                    readOnly: true,
                    cursorColor: Colors.green,
                    onChanged: (value) {},
                    onTap: () {
                      _showProductSheet();
                    },
                    enabled: true,
                    controller: product_name_Controller,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.arrow_drop_down_outlined,
                          color: Colors.black),
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
                      hintText: "Select Product Name",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 10, left: 10),
                            child: Text(
                              "Available Quantity *",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: _width / 2.3,
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              cursorColor: Colors.green,
                              onChanged: (value) {},
                              enabled: true,
                              controller: quantity_Controller,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color(0xffD3D3D3).withOpacity(0.5),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "Enter Quantity",
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 10, left: 10),
                            child: Text(
                              "Unit *",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: _width / 2.3,
                            child: TextField(
                              readOnly: true,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              cursorColor: Colors.green,
                              onChanged: (value) {},
                              enabled: true,
                              onTap: () {},
                              controller: unitController,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "Select Unit",
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 10, left: 10),
                            child: Text(
                              "Unit Price *",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: _width / 2.3,
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              cursorColor: Colors.green,
                              onChanged: (value) {},
                              enabled: true,
                              controller: price_Controller,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color(0xffD3D3D3).withOpacity(0.5),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "Price",
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, bottom: 10, left: 10),
                            child: Text(
                              "Available Date *",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: _width / 2.3,
                            child: TextFormField(
                              enabled: true,
                              focusNode: AlwaysDisabledFocusNode(),
                              onTap: () {
                                _selectDate(context);
                              },
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black12, width: 2.0),
                                ),
                                border: OutlineInputBorder(),
                                hintText: "Date",
                                contentPadding: EdgeInsets.all(10),
                                suffixIcon: Icon(Icons.date_range),
                              ),
                              keyboardType: TextInputType.datetime,
                              controller: date_availableController,
                            ),
                          ),
                        ],
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 25),
                  child: Row(
                    children: const [
                      Text(
                        "Description *",
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
                    minLines: 1,
                    maxLines: 5,
                    // allow user to enter 5 line in textfield
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {},
                    enabled: true,
                    controller: description_Controller,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffD3D3D3).withOpacity(0.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Description About your product",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 40, left: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price Negotiable:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ChoiceChip(
                                  label: Text("Yes",
                                      style: TextStyle(fontSize: 16)),
                                  labelStyle: TextStyle(color: Colors.white),
                                  selectedColor: Colors.green,
                                  backgroundColor: Colors.grey,
                                  selected: true,
                                  onSelected: (selected) {},
                                ),
                                ChoiceChip(
                                  label: Text("No",
                                      style: TextStyle(fontSize: 16)),
                                  labelStyle: TextStyle(color: Colors.white),
                                  selectedColor: Colors.green,
                                  backgroundColor: Colors.grey,
                                  selected: true,
                                  onSelected: (selected) {},
                                ),
                              ],
                            )
                          ],
                        )
                      ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 40, left: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Show Product To Buyers:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ChoiceChip(
                                  label: const Text("Yes",
                                      style: TextStyle(fontSize: 16)),
                                  labelStyle: TextStyle(color: Colors.white),
                                  selectedColor: Colors.green,
                                  backgroundColor: Colors.grey,
                                  selected: true,
                                  onSelected: (selected) {},
                                ),
                                ChoiceChip(
                                  label: const Text("No",
                                      style: TextStyle(fontSize: 16)),
                                  labelStyle: TextStyle(color: Colors.white),
                                  selectedColor: Colors.green,
                                  backgroundColor: Colors.grey,
                                  selected: true,
                                  onSelected: (selected) {},
                                ),
                              ],
                            )
                          ],
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 8, left: 8),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        height: 50.0,
                        onPressed: () {},
                        color: Colors.green,
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
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
