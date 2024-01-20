import '../repositories/fruit_repository.dart';

class DeleteFruitUsecase {
  final FruitRepositoryD repository;

  DeleteFruitUsecase(this.repository);

  Future<void> deleteFruit(String id) async {
    return await repository.deleteFruit(id);
  }
}