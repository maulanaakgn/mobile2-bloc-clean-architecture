import '../../domain/entities/fruit.dart';
import '../../domain/repositories/fruit_repository.dart';
import '../datasources/fruit_remote_data_source.dart';
import '../models/fruit_model.dart';

class FruitRepositoryImpl extends FruitRepositoryD {
  final FruitRemoteDataSource remoteDataSource;

  FruitRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Fruit>> getFruits() async {
    try {
      final List<Map<String, dynamic>> fruitData =
          await remoteDataSource.getFruits();
      return fruitData.map((data) => FruitModel.fromJson(data)).toList();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateFruit(Fruit updatedFruit) async {
    try {
      await remoteDataSource.updateFruit(updatedFruit);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> addFruit(Fruit newFruit) async {
    try {
      await remoteDataSource.addFruit(newFruit);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> deleteFruit(String id) async {
    try {
      await remoteDataSource.deleteFruit(id);
    } catch (error) {
      throw Exception(error);
    }
  }
}