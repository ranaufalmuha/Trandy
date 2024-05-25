// ignore_for_file: camel_case_types, non_constant_identifier_names

class datagas {
  final String id_gas;
  final String nama_gas;
  final String lat_gas;
  final String long_gas;

  const datagas({
    required this.id_gas,
    required this.nama_gas,
    required this.lat_gas,
    required this.long_gas,
  });

  factory datagas.fromJson(Map<String, dynamic> json) {
    return datagas(
      id_gas: json['id_gas'],
      nama_gas: json['nama_gas'],
      lat_gas: json['lat_gas'],
      long_gas: json['long_gas'],
    );
  }
}
