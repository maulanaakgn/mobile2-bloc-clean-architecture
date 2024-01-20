import '../entities/fruit.dart';
import '../repositories/fruit_repository.dart';

class AddFruitUsecase {
  final FruitRepositoryD repository;

  AddFruitUsecase(this.repository);

  Future<void> addFruit(Fruit newFruit) async {
    return await repository.addFruit(newFruit);
  }
}