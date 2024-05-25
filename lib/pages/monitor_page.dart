import 'package:flutter/material.dart';
import 'package:transport_app/components/my_text.dart';

class MonitorPage extends StatefulWidget {
  const MonitorPage({super.key});

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  double pads = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pads),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            const MyText(
              text: 'Monitor',
              size: 27,
              color: Colors.black,
              padding: 5,
              bold: true,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 600,
              child: GridView.count(
                childAspectRatio: 5 / 4,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(10, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(link[index]),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 90,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(.5),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: MyText(
                              text: jalan[index],
                              size: 10,
                              color: Colors.white,
                              padding: 0,
                              bold: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> link = [
    "https://suaranusantara.com/wp-content/uploads/2019/05/CCTV-PEREMPATAN-UNIS-TANGERANG-24-MEI-2019.jpg",
    "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/12/12/431853381.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVg6v0jdI7QitqldAYirGrj04sEWwliQIZsQ&usqp=CAU",
    "https://bone.go.id/wp-content/uploads/2018/03/FB_IMG_1574746601043-300x245.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSid-fg-n1-GrvyTHGQWN_hBNPHr-SP5mP6Lj2yWmGMfTSQlwnw3AD3VsjCYB1a6RYl0X4&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlZQAi2eHJFtm9aOyCbOIQ0aHD5KozRa4uUw&usqp=CAU",
    "https://bone.go.id/wp-content/uploads/2018/03/FB_IMG_1574746601043-300x245.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlZQAi2eHJFtm9aOyCbOIQ0aHD5KozRa4uUw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVg6v0jdI7QitqldAYirGrj04sEWwliQIZsQ&usqp=CAU",
    "https://suaranusantara.com/wp-content/uploads/2019/05/CCTV-PEREMPATAN-UNIS-TANGERANG-24-MEI-2019.jpg",
  ];
  List<String> jalan = [
    "Padang, Jl.Sudirman simpang 4",
    "Padang, Jl.Soekarno ",
    "Padang, Jl.simpang 4",
    "Padang, Jl.K.H Ahmad Dahlan",
    "Padang, Jl.Jhoni Anwar",
    "Padang, Jl.Thamrin",
    "Padang, Jl.Gayung Kebonsari",
    "Padang, Jl.Ngagel Jaya Selatan",
    "Padang, Jl.Mayjen HR. Mohammad",
    "Padang, Jl.Rungkut Menanggal",
  ];
}
