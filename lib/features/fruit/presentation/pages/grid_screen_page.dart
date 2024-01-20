import 'package:flutter/material.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/shared/themes.dart';

class GridScreenPage extends StatefulWidget {
  const GridScreenPage({Key? key}) : super(key: key);

  @override
  State<GridScreenPage> createState() => _GridScreenPageState();
}

class _GridScreenPageState extends State<GridScreenPage> {
  @override
  Widget build(BuildContext context) {
    List<String> fruitImageUrls = [
      'https://static.vecteezy.com/system/resources/previews/013/442/160/original/red-apple-on-transparent-background-free-png.png',
      'https://clipart-library.com/image_gallery2/Banana.png',
      'https://static.vecteezy.com/system/resources/previews/029/200/379/original/orange-or-tangerine-transparent-background-free-png.png',
      'https://static.vecteezy.com/system/resources/previews/022/430/928/non_2x/free-bunch-of-grapes-on-transparent-background-free-png.png',
    ];

    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.only(top: 10, left: defaultMargin, right: defaultMargin),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: fruitImageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return _imageContainer(fruitImageUrls, index);
        },
      ),
    );
  }

  Container _imageContainer(List<String> fruitImageUrls, int index) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: kWhiteGreyColor,
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
      ),
      child: _image(fruitImageUrls, index),
    );
  }

  Center _image(List<String> fruitImageUrls, int index) {
    return Center(
      child: Image.network(
        fruitImageUrls[index],
        width: 160.0,
        height: 160.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
