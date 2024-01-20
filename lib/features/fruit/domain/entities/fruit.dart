class Fruit {
  String id;
  String jenis;
  int kalori;
  String keterangan;
  String nama;
  List<String> vitamin;

  Fruit({
    required this.id,
    required this.jenis,
    required this.kalori,
    required this.keterangan,
    required this.nama,
    required this.vitamin,
  });

  Map<String, dynamic> toJson() {
    return {
      'jenis': jenis,
      'kalori': kalori,
      'keterangan': keterangan,
      'nama': nama,
      'vitamin': vitamin,
    };
  }

  factory Fruit.fromJson(String id, Map<String, dynamic> json) {
    return Fruit(
      id: id,
      jenis: json['jenis'],
      kalori: json['kalori'],
      keterangan: json['keterangan'],
      nama: json['nama'],
      vitamin: List<String>.from(json['vitamin']),
    );
  }
}
