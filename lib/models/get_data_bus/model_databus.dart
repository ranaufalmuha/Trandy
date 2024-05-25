// ignore_for_file: camel_case_types, non_constant_identifier_names

class databus {
  final String id_bus;
  final String nama_bus;
  final String rate_bus;
  final String jumlah_kursi;
  final String lat_bus;
  final String long_bus;

  const databus({
    required this.id_bus,
    required this.nama_bus,
    required this.rate_bus,
    required this.jumlah_kursi,
    required this.lat_bus,
    required this.long_bus,
  });

  factory databus.fromJson(Map<String, dynamic> json) {
    return databus(
      id_bus: json['id_bus'],
      nama_bus: json['nama_bus'],
      rate_bus: json['rate_bus'],
      jumlah_kursi: json['jumlah_kursi'],
      lat_bus: json['lat_bus'],
      long_bus: json['long_bus'],
    );
  }
}
