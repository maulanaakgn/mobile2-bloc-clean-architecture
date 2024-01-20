import '../../domain/entities/fruit.dart';

class FruitModel extends Fruit {
  FruitModel({
    required String id,
    required String jenis,
    required int kalori,
    required String keterangan,
    required String nama,
    required List<String> vitamin,
  }) : super(
          id: id,
          jenis: jenis,
          kalori: kalori,
          keterangan: keterangan,
          nama: nama,
          vitamin: vitamin,
        );

  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      id: json['id'],
      jenis: json['jenis'],
      kalori: json['kalori'],
      keterangan: json['keterangan'],
      nama: json['nama'],
      vitamin: List<String>.from(json['vitamin']),
    );
  }
}