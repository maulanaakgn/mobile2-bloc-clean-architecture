import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/pages/edit_fruit_page.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/shared/themes.dart';

import '../../domain/entities/fruit.dart';
import '../bloc/fruit_bloc.dart';

class FruitListPage extends StatefulWidget {
  const FruitListPage({super.key});

  @override
  _FruitListPageState createState() => _FruitListPageState();
}

class _FruitListPageState extends State<FruitListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
          if (state is FruitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FruitSuccess) {
            return _containerList(state);
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Padding _floatingActionButton() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      child: FloatingActionButton(
        backgroundColor: kBlackColor,
        onPressed: () {
          navigateToEditScreen(null);
        },
        mini: true,
        child: Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }

  Container _containerList(FruitSuccess state) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 10,
      ),
      child: ListView.separated(
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  navigateToEditScreen(state.fruits[index]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteGreyColor,
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/image_pineapple.png',
                            ),
                            scale: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: state.fruits[index].jenis,
                                    style: kBlackTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  TextSpan(text: ' | ', style: kBlackTextStyle),
                                  TextSpan(
                                    text:
                                        '${state.fruits[index].kalori} kalori',
                                    style: kBlackTextStyle.copyWith(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: regular,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              state.fruits[index].keterangan,
                              style: kBlackTextStyle.copyWith(
                                fontSize: 13,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '• ${state.fruits[index].vitamin.join('\n• ')}',
                              style: kBlackTextStyle.copyWith(
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<FruitBloc>(context)
                              .add(DeleteFruitEvent(state.fruits[index].id));
                        },
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: kBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: state.fruits.length),
    );
  }

  void navigateToEditScreen(Fruit? fruit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFruitPage(fruit),
      ),
    );
  }
}
