part of 'fruit_bloc.dart';

abstract class FruitState {}

class FruitInitial extends FruitState {}

class FruitLoading extends FruitState {}

class FruitSuccess extends FruitState {
  final List<Fruit> fruits;

  FruitSuccess({required this.fruits});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FruitSuccess && listEquals(other.fruits, fruits);
  }

  @override
  int get hashCode => fruits.hashCode;
}