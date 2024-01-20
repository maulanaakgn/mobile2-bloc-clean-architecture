import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tugas2/features/fruit/domain/repositories/fruit_repository.dart';

import '../../domain/entities/fruit.dart';

part 'fruit_event.dart';
part 'fruit_state.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  final FruitRepositoryD repository;

  FruitBloc(this.repository) : super(FruitInitial()) {
    on<GetFruitsEvent>(
      (event, emit) async {
        emit(FruitLoading());
        try {
          final fruits = await repository.getFruits();

          emit(FruitSuccess(fruits: fruits));
        } catch (error) {
          if (kDebugMode) {
            print(error);
          }
        }
      },
    );

    on<UpdateFruitEvent>(
      (event, emit) async {
        emit(FruitLoading());
        try {
          await repository.updateFruit(event.updatedFruit);
          add(GetFruitsEvent());
        } catch (error) {
          if (kDebugMode) {
            print(error);
          }
        }
      },
    );

    on<AddFruitEvent>(
      (event, emit) async {
        emit(FruitLoading());
        try {
          await repository.addFruit(event.newFruit);
          add(GetFruitsEvent());
        } catch (error) {
          if (kDebugMode) {
            print(error);
          }
        }
      },
    );

    on<DeleteFruitEvent>(
      (event, emit) async {
        emit(FruitLoading());
        try {
          await repository.deleteFruit(event.id);
          add(GetFruitsEvent());
        } catch (error) {
          if (kDebugMode) {
            print(error);
          }
        }
      },
    );
  }
}
