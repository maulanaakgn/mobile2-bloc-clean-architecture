import '../entities/fruit.dart';
import '../repositories/fruit_repository.dart';

class UpdateFruitUsecase {
  final FruitRepositoryD repository;

  UpdateFruitUsecase(this.repository);

  Future<void> updateFruit(Fruit updatedFruit) async {
    return await repository.updateFruit(updatedFruit);
  }
}