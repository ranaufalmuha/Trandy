import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/my_text.dart';
import 'home_page.dart';

class OrderFood extends StatelessWidget {
  const OrderFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: MyText(
          text: "Order Food",
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
      body: ListView(
        children: [
          SizedBox(height: 20),
          MyText(
            text: "Fast Food",
            size: 20,
            color: Colors.white,
            padding: 20,
            bold: true,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 22),
                MyContainers(
                  text: "Kebab blasan",
                  url:
                      "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/7/30/73dee6a2-1eb0-4c2f-99b1-88596950db6b.jpg",
                  rate: '5.0',
                ),
                MyContainers(
                    text: "Sushi",
                    url:
                        "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/1/11/a5be3f40-f94b-47ea-aa2b-9e081fe160b4.jpg",
                    rate: '4.6'),
                MyContainers(
                    text: "KFC",
                    url:
                        "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/5/29/6d87f4ab-8b0d-46ff-9d23-c2a9fca5df4d.jpg",
                    rate: '4.6'),
              ],
            ),
          ),
          SizedBox(height: 20),
          MyText(
            text: "Noodles",
            size: 20,
            color: Colors.white,
            padding: 20,
            bold: true,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 22),
                MyContainers(
                    text: "Spicy Garlic Noodles",
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjzMMSUsAhuryv4Y7bAHSXfLTS7wXqal2x3A&usqp=CAU",
                    rate: '4.0'),
                MyContainers(
                    text: "Chicken Soft Noodles",
                    url:
                        "https://angaara5.in/wp-content/uploads/2020/07/4-Chicken-Soft-Noodles-500-x-500.jpg",
                    rate: '4.3'),
                MyContainers(
                    text: "Tonkotsu",
                    url:
                        "https://glebekitchen.com/wp-content/uploads/2017/04/tonkotsuramenfront-500x500.jpg",
                    rate: '4.8'),
              ],
            ),
          ),
          SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 22),
                MyContainers(
                    text: "Potato chilli",
                    url:
                        "https://www.sharmispassions.com/wp-content/uploads/2017/05/MasalaPasta5-500x500.jpg",
                    rate: '4.0'),
                MyContainers(
                    text: "Mixue",
                    url:
                        "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/11/2/7d9dc4a6-2c6d-4fcc-abff-314a5e81261b.jpg",
                    rate: '4.7'),
                MyContainers(
                    text: "Chichen Noodles",
                    url:
                        "https://angaara5.in/wp-content/uploads/2020/07/4-Chicken-Soft-Noodles-500-x-500.jpg",
                    rate: '4.8'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyContainers extends StatelessWidget {
  String text;
  String url;
  String rate;
  MyContainers({
    super.key,
    required this.text,
    required this.url,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    double fontsz = 13;
    return GestureDetector(
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
                      text: " The Restaurant and driver \n Prepared your food",
                      size: 15,
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
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.network(url),
                      SizedBox(height: 10),
                      MyText(
                        text: text,
                        size: fontsz,
                        color: Colors.blue,
                        padding: 0,
                        bold: true,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.blue,
                      ),
                      child: MyText(
                        text: "+ Buy",
                        size: 13,
                        color: Colors.white,
                        padding: 0,
                        bold: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(3),
              color: Colors.white,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: fontsz,
                    color: Colors.amber,
                  ),
                  MyText(
                    text: rate,
                    size: fontsz,
                    color: Colors.blue,
                    padding: 0,
                    bold: false,
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
