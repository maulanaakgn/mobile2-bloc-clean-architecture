import '../entities/fruit.dart';

abstract class FruitRepositoryD {
  Future<List<Fruit>> getFruits();
  Future<void> updateFruit(Fruit updatedFruit);
  Future<void> addFruit(Fruit newFruit);
  Future<void> deleteFruit(String id);
}