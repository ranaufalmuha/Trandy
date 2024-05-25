// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transport_app/components/my_text.dart';
import 'package:transport_app/models/get_data_bus/model_databus.dart';
import 'package:transport_app/models/get_data_bus/repo_databus.dart';
import 'package:transport_app/models/get_data_schedule/model_dataschedule.dart';
import 'package:transport_app/models/get_data_schedule/repo_dataschedule.dart';
import 'package:transport_app/pages/detailbus_page.dart';
import 'package:transport_app/pages/profile_page.dart';

import 'routemap_page.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  // component
  final Color _cardColor = Colors.blue;
  List<Color> _btnColor = [Colors.blue, Colors.blue, Colors.blue];
  List<Color> _textColor = [Colors.white, Colors.white, Colors.white];
  List<bool> _isOnTap = [false, false, false];
  List<bool> _isFilter = [false, false, false];
  final double _sizeCard = 12;
  final double _size1Card = 14;

  // Date

  //-----------------------get data bus-----------------------
  List<databus> listbus = [];
  databusRepository busrepo = databusRepository();

  //-----------------------get data schedule-----------------------
  List<dataschedule> listschedule = [];
  List<dataschedule> listschedulethisday = [];
  List<dataschedule> listschedulethisweek = [];
  List<dataschedule> listschedulethismonth = [];
  datascheduleRepository schedulerepo = datascheduleRepository();

  // Read
  getData() async {
    listschedule = await schedulerepo.getData();
    listschedulethisday = await schedulerepo.getDataThisDay();
    listschedulethisweek = await schedulerepo.getDataThisWeek();
    listschedulethismonth = await schedulerepo.getDataThisMonth();

    listbus = await busrepo.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  double size = 13;
  double size1 = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: MyText(
          text: "Schedule",
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
                builder: (context) => const SchedulePage(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: listschedule.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // This day
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              int index = 0;
                              for (int i = 0; i < _isOnTap.length; i++) {
                                if (_isOnTap[index]) {
                                  _btnColor[i] = Colors.blue;
                                  _textColor[i] = Colors.white;
                                  _isOnTap[i] = false;
                                  _isFilter[i] = false;
                                } else {
                                  if (i == index) {
                                    _btnColor[index] = Colors.white;
                                    _textColor[index] = Colors.blue;
                                    _isOnTap[index] = true;
                                    _isFilter[index] = true;
                                  } else {
                                    _btnColor[i] = Colors.blue;
                                    _textColor[i] = Colors.white;
                                    _isOnTap[i] = false;
                                    _isFilter[i] = false;
                                  }
                                }
                              }
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              color: _btnColor[0],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: MyText(
                                text: "This day",
                                size: 12,
                                color: _textColor[0],
                                padding: 0,
                                bold: false,
                              ),
                            ),
                          ),
                        ),
                        // This Month
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              int index = 1;
                              for (int i = 0; i < _isOnTap.length; i++) {
                                if (_isOnTap[index]) {
                                  _btnColor[i] = Colors.blue;
                                  _textColor[i] = Colors.white;
                                  _isOnTap[i] = false;
                                  _isFilter[i] = false;
                                } else {
                                  if (i == index) {
                                    _btnColor[index] = Colors.white;
                                    _textColor[index] = Colors.blue;
                                    _isOnTap[index] = true;
                                    _isFilter[index] = true;
                                  } else {
                                    _btnColor[i] = Colors.blue;
                                    _textColor[i] = Colors.white;
                                    _isOnTap[i] = false;
                                    _isFilter[i] = false;
                                  }
                                }
                              }
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              color: _btnColor[1],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: MyText(
                                text: "This Week",
                                size: 12,
                                color: _textColor[1],
                                padding: 0,
                                bold: false,
                              ),
                            ),
                          ),
                        ),
                        // This 2 Month
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              int index = 2;
                              for (int i = 0; i < _isOnTap.length; i++) {
                                if (_isOnTap[index]) {
                                  _btnColor[i] = Colors.blue;
                                  _textColor[i] = Colors.white;
                                  _isOnTap[i] = false;
                                  _isFilter[i] = false;
                                } else {
                                  if (i == index) {
                                    _btnColor[index] = Colors.white;
                                    _textColor[index] = Colors.blue;
                                    _isOnTap[index] = true;
                                    _isFilter[index] = true;
                                  } else {
                                    _btnColor[i] = Colors.blue;
                                    _textColor[i] = Colors.white;
                                    _isOnTap[i] = false;
                                    _isFilter[i] = false;
                                  }
                                }
                              }
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              color: _btnColor[2],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: MyText(
                                text: "This Month",
                                size: 12,
                                color: _textColor[2],
                                padding: 0,
                                bold: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _isFilter[0]
                      ? listschedulethisday.isNotEmpty
                          ? Column(
                              children: [
                                Hari(listschedulethisday[0].hari),
                                TheScheduleFilter(listschedulethisday),
                              ],
                            )
                          : NoSchedule()
                      : _isFilter[1]
                          ? listschedulethisweek.isNotEmpty
                              ? TheScheduleFilter(listschedulethisweek)
                              : NoSchedule()
                          : _isFilter[2]
                              ? listschedulethismonth.isNotEmpty
                                  ? TheScheduleFilter(listschedulethismonth)
                                  : NoSchedule()
                              : listschedule.isNotEmpty
                                  ? TheScheduleFilter(listschedule)
                                  : NoSchedule()
                ],
              ),
            )
          : Center(
              child: Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  // Show the active filter
  Widget TheScheduleFilter(List _thelist) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8.0,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _thelist.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 7 / 4.5,
        ),
        itemBuilder: (context, index) {
          final item = _thelist[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailBusPage(
                    harga: item.harga,
                    hari: item.hari,
                    dari: item.dari,
                    menuju: item.menuju,
                    nama_bus: item.nama_bus,
                    jam_berangkat: item.jam_berangkat,
                    rate_bus: item.rate_bus,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Container(
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
                        text: "${item.hari}",
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
                            text: item.nama_bus,
                            size: _size1Card,
                            color: _cardColor,
                            padding: 0,
                            bold: true,
                          ),
                          Row(
                            children: [
                              MyText(
                                text: '\$' + "${item.harga}",
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
                                      text: " ${item.dari}",
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
                                      text: " ${item.menuju}",
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
                                    text: "on : ${item.jam_berangkat}",
                                    size: _sizeCard,
                                    color: _cardColor,
                                    padding: 0,
                                    bold: false,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 103),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Colors.yellow.shade800,
                                        ),
                                        MyText(
                                          text: item.rate_bus,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => RouteMap(
                                        BusLat: item.lat_bus,
                                        BusLng: item.long_bus,
                                        BusName: item.nama_bus,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 50,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: _cardColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.map,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
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
          );
        },
      ),
    );
  }

  Widget NoSchedule() {
    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          "No Schedule",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Row Hari(String hari) {
    return Row(
      children: [
        MyText(
          text: hari,
          size: 23,
          color: Colors.white,
          padding: 30,
          bold: true,
        ),
      ],
    );
  }
}
