// ignore_for_file: camel_case_types, non_constant_identifier_names

class dataschedule {
  final String lat_bus;
  final String long_bus;
  final String id_bus;
  final String nama_bus;
  final String rate_bus;
  final String jumlah_kursi;
  final String tgl_berangkat;
  final String jam_berangkat;
  final String dari;
  final String menuju;
  final String hari;
  final String tgl;
  final String harga;

  const dataschedule({
    required this.lat_bus,
    required this.long_bus,
    required this.id_bus,
    required this.nama_bus,
    required this.rate_bus,
    required this.jumlah_kursi,
    required this.tgl_berangkat,
    required this.jam_berangkat,
    required this.dari,
    required this.menuju,
    required this.hari,
    required this.tgl,
    required this.harga,
  });

  factory dataschedule.fromJson(Map<String, dynamic> json) {
    return dataschedule(
      lat_bus: json['lat_bus'],
      long_bus: json['long_bus'],
      id_bus: json['id_bus'],
      nama_bus: json['nama_bus'],
      rate_bus: json['rate_bus'],
      jumlah_kursi: json['jumlah_kursi'],
      tgl_berangkat: json['tgl_berangkat'],
      jam_berangkat: json['jam_berangkat'],
      dari: json['dari'],
      menuju: json['menuju'],
      hari: json['hari'],
      tgl: json['tgl'],
      harga: json['harga'],
    );
  }
}
