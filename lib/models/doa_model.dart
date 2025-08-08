class DoaModel {
  final String id;
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;

  DoaModel(
      {required this.id,
      required this.doa,
      required this.ayat,
      required this.latin,
      required this.artinya});

  factory DoaModel.fromJson(Map<String, dynamic> json) {
    return DoaModel(
      doa: json['doa'],
      id: json['id'],
      ayat: json['ayat'],
      latin: json['latin'],
      artinya: json['artinya']
    );
  }
}