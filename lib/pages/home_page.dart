import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transport_app/components/my_text.dart';
import 'package:transport_app/models/get_data_schedule/model_dataschedule.dart';
import 'package:transport_app/models/get_data_schedule/repo_dataschedule.dart';
import 'package:transport_app/pages/orderfood_page.dart';
import 'package:transport_app/pages/schedule_page.dart';
import 'package:transport_app/pages/taxibike_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double pads = 30;
  //-----------------------get data schedule-----------------------
  List<dataschedule> listschedule = [];
  datascheduleRepository schedulerepo = datascheduleRepository();

  // Read
  getData() async {
    listschedule = await schedulerepo.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return listschedule.isNotEmpty
        ? ListView(
            children: [
              //---------------------------appbarnya---------------------------
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: pads - 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ImageIcon(AssetImage("assets/trandy-logo.png")),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://installationmag.com/wp-content/uploads/2021/11/WhatsApp-Image-2021-09-03-at-00.01.13-1200x1200.jpeg',
                        ),
                        radius: 15,
                      ),
                    ),
                  ],
                ),
              ),

              //---------------------------nama dan text---------------------------
              const SizedBox(height: 15),
              MyText(
                text: 'Hi ifal,',
                color: Colors.black,
                size: 24,
                padding: pads,
                bold: true,
              ),
              MyText(
                text: 'Where you want to go?',
                color: Colors.black,
                size: 24,
                padding: pads,
                bold: true,
              ),
              const SizedBox(height: 3),
              Padding(
                padding: EdgeInsets.only(left: pads),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.location_on_rounded,
                      size: 14,
                      color: Colors.black54,
                    ),
                    Text(
                      ' Padang',
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              // Content Grid
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(30),
                crossAxisSpacing: 20,
                crossAxisCount: 3,
                children: <Widget>[
                  MyGridFitur(Icons.bike_scooter, "taxibike", TaxibikePage()),
                  MyGridFitur(Icons.car_repair_rounded, "taxi", TaxibikePage()),
                  MyGridFitur(Icons.food_bank_outlined, "Foods", OrderFood()),
                  MyGridFitur(Icons.present_to_all, "Delivery", TaxibikePage()),
                  MyGridFitur(Icons.train, "Train", TaxibikePage()),
                  MyGridFitur(Icons.bus_alert, "Bus", TaxibikePage()),
                ],
              ),

              //---------------------------bus rank---------------------------
              Row(
                children: [
                  MyText(
                    text: 'Top Bus',
                    size: 24,
                    color: Colors.black,
                    padding: pads,
                    bold: true,
                  ),
                ],
              ),
              //--------------Container bus Rank--------------
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: pads,
                  vertical: 6,
                ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 10,
                        offset: const Offset(5, 7),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: listschedule[0].nama_bus,
                          size: 13,
                          color: Colors.grey.shade600,
                          padding: 0,
                          bold: false,
                        ),
                        Row(
                          children: [
                            MyText(
                              text: "rating : ",
                              size: 12,
                              color: Colors.grey.shade600,
                              padding: 0,
                              bold: false,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow.shade800,
                            ),
                            MyText(
                              text: listschedule[0].rate_bus,
                              size: 12,
                              color: Colors.grey.shade600,
                              padding: 3,
                              bold: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //---------------------------Schedule---------------------------
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'Bus Schedule',
                    color: Colors.black,
                    size: 24,
                    padding: pads,
                    bold: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SchedulePage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: pads),
                      child: Row(
                        children: const [
                          MyText(
                            text: 'See schedule',
                            size: 13,
                            color: Colors.blue,
                            padding: 0,
                            bold: false,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //--------------Container bus Schedule--------------
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: pads - 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: listschedule.length,
                  itemBuilder: (context, index) {
                    final item = listschedule[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                              Column(
                                children: [
                                  MyText(
                                    text: item.hari,
                                    color: Colors.white,
                                    size: 13,
                                    padding: 0,
                                    bold: false,
                                  ),
                                  MyText(
                                    text: item.tgl_berangkat,
                                    color: Colors.white,
                                    size: 13,
                                    padding: 0,
                                    bold: false,
                                  ),
                                ],
                              ),
                              MyText(
                                text: item.tgl,
                                color: Colors.white,
                                size: 50,
                                padding: 0,
                                bold: true,
                              ),
                              MyText(
                                text: '${item.dari} > ${item.menuju}',
                                color: Colors.white,
                                size: 13,
                                padding: 0,
                                bold: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          )
        : const Center(
            child: Text('loading...'),
          );
  }

  Widget MyGridFitur(IconData icon, String text, Widget pages) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => pages,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(
                text.toLowerCase(),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
