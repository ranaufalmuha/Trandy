import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transport_app/components/my_text.dart';
import 'package:transport_app/pages/schedule_page.dart';

class DetailBusPage extends StatelessWidget {
  String harga;
  String hari;
  String dari;
  String menuju;
  String nama_bus;
  String jam_berangkat;
  String rate_bus;
  DetailBusPage({
    super.key,
    required this.harga,
    required this.hari,
    required this.dari,
    required this.menuju,
    required this.nama_bus,
    required this.jam_berangkat,
    required this.rate_bus,
  });

  @override
  Widget build(BuildContext context) {
    final Color _cardColor = Colors.blue;
    final double _sizeCard = 12;
    final double _size1Card = 14;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => const SchedulePage(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.blue,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    MyText(
                      text: '\$' + "${harga}",
                      size: 17,
                      color: Colors.black,
                      padding: 0,
                      bold: false,
                    ),
                    MyText(
                      text: '/seat',
                      size: 17 - 2,
                      color: Colors.grey,
                      padding: 0,
                      bold: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check, color: Colors.white),
                                MyText(
                                  text: " Payment Succes",
                                  size: 17,
                                  color: Colors.white,
                                  padding: 0,
                                  bold: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: MyText(
                        bold: true,
                        size: 15,
                        padding: 0,
                        text: "Pay",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 10,
                    offset: const Offset(5, 17),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: hari,
                      size: 15,
                      color: _cardColor,
                      padding: 0,
                      bold: true,
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: nama_bus,
                          size: _size1Card,
                          color: _cardColor,
                          padding: 0,
                          bold: true,
                        ),
                        Row(
                          children: [
                            MyText(
                              text: '\$' + "${harga}",
                              size: _sizeCard,
                              color: _cardColor,
                              padding: 0,
                              bold: false,
                            ),
                            MyText(
                              text: '/seat',
                              size: _sizeCard - 2,
                              color: Colors.grey,
                              padding: 0,
                              bold: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        // --------------------- Dari Menuju ---------------------
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.work_outline,
                                    size: 15,
                                    color: _cardColor,
                                  ),
                                  MyText(
                                    text: " ${dari}",
                                    size: _sizeCard,
                                    color: Colors.grey,
                                    padding: 0,
                                    bold: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.work,
                                    size: 15,
                                    color: _cardColor,
                                  ),
                                  MyText(
                                    text: " ${menuju}",
                                    size: _sizeCard,
                                    color: Colors.grey,
                                    padding: 0,
                                    bold: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // --------------------- Dari Menuju ---------------------

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                MyText(
                                  text: "on : ${jam_berangkat}",
                                  size: _sizeCard,
                                  color: _cardColor,
                                  padding: 0,
                                  bold: false,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 103),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow.shade800,
                                      ),
                                      MyText(
                                        text: rate_bus,
                                        size: 12,
                                        color: _cardColor,
                                        padding: 3,
                                        bold: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 10,
                    offset: const Offset(5, 17),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.discount,
                      color: Colors.blue,
                    ),
                    MyText(
                      text: "Use Promo",
                      size: 17,
                      color: Colors.blue,
                      padding: 15,
                      bold: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
