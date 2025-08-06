class DoaModel {
  final int id;
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;

  const DoaModel({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });

  factory DoaModel.fromJson(Map<String, dynamic> json) {
    return DoaModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      doa: json['doa'] ?? '',
      ayat: json['ayat'] ?? '',
      latin: json['latin'] ?? '',
      artinya: json['artinya'] ?? '',
    );
  }
}