import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transport_app/components/my_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://installationmag.com/wp-content/uploads/2021/11/WhatsApp-Image-2021-09-03-at-00.01.13-1200x1200.jpeg"),
                      radius: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'Ifal',
                            size: 15,
                            color: Colors.white,
                            padding: 0,
                            bold: true,
                          ),
                          MyText(
                            text: '082432*****65',
                            size: 13,
                            color: Colors.white,
                            padding: 0,
                            bold: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Container(
                  width: 220,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: 'Balance = ',
                        size: 17,
                        color: Colors.blue,
                        padding: 0,
                        bold: false,
                      ),
                      MyText(
                        text: 'Rp.123.600',
                        size: 17,
                        color: Colors.blue,
                        padding: 0,
                        bold: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 35),
        MyText(
          text: "My Acivity",
          size: 17,
          color: Colors.black,
          padding: 20,
          bold: true,
        ),
        SizedBox(height: 8),
        MyListAkun(Icons.list_alt_outlined, "Transaction"),
        MyListAkun(Icons.widgets_sharp, "Wishlist"),
        MyListAkun(Icons.star, "Review"),
        MyListAkun(Icons.payment, "Payment"),
        SizedBox(height: 10),
        MyText(
          text: "All Category",
          size: 17,
          color: Colors.black,
          padding: 20,
          bold: true,
        ),
        SizedBox(height: 8),
        MyListAkun(Icons.discount, "Promo"),
        MyListAkun(Icons.language, "Choose Language"),
        MyListAkun(Icons.notifications, "Notifications"),
      ],
    );
  }

  Widget MyListAkun(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20),
              MyText(
                text: text,
                size: 14,
                color: Colors.black,
                padding: 10,
                bold: false,
              ),
            ],
          ),
          Icon(Icons.navigate_next_outlined)
        ],
      ),
    );
  }
}
