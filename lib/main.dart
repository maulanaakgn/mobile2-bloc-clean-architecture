import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tugas2/features/fruit/domain/repositories/fruit_repository.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/widgets/main_menu.dart';

import 'features/fruit/data/datasources/fruit_remote_data_source.dart';
import 'features/fruit/data/repositories/fruit_repository.dart';
import 'features/fruit/presentation/bloc/fruit_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FruitRepositoryD fruitRepository = FruitRepositoryImpl(
      FruitRemoteDataSource(),
    );

    return BlocProvider(
      create: (context) => FruitBloc(fruitRepository)..add(GetFruitsEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainMenu(),
      ),
    );
  }
}
