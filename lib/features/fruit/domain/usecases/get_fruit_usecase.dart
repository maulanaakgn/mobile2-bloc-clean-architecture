import '../entities/fruit.dart';
import '../repositories/fruit_repository.dart';

class GetFruitUsecase {
  final FruitRepositoryD repository;

  GetFruitUsecase(this.repository);

  Future<List<Fruit>> execute() async {
    return await repository.getFruits();
  }
}