import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transport_app/pages/home_page.dart';

import '../components/my_text.dart';

class TaxibikePage extends StatefulWidget {
  const TaxibikePage({super.key});

  @override
  State<TaxibikePage> createState() => _TaxibikePageState();
}

class _TaxibikePageState extends State<TaxibikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: MyText(
          text: "Taxibike",
          size: 20,
          color: Colors.white,
          padding: 0,
          bold: true,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            text: "wherever you go, we are ready to serve",
            size: 15,
            color: Colors.white,
            padding: 0,
            bold: false,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 150, left: 30, right: 30),
            child: Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      "https://www.weather-forecast.com/locationmaps/Padang.10.gif",
                      scale: .8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                      text: " you get the driver",
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
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: MyText(
                          text: "Find The Taxibike",
                          size: 13,
                          color: Colors.white,
                          padding: 0,
                          bold: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
