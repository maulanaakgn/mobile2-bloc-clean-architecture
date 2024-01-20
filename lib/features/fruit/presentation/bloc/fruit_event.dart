part of 'fruit_bloc.dart';

abstract class FruitEvent {}

class GetFruitsEvent extends FruitEvent {}

class UpdateFruitEvent extends FruitEvent {
  final Fruit updatedFruit;

  UpdateFruitEvent(this.updatedFruit);
}

class AddFruitEvent extends FruitEvent {
  final Fruit newFruit;

  AddFruitEvent(this.newFruit);
}

class DeleteFruitEvent extends FruitEvent {
  final String id;

  DeleteFruitEvent(this.id);
}