import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/shared/themes.dart';

import '../../domain/entities/fruit.dart';
import '../bloc/fruit_bloc.dart';

class EditFruitPage extends StatefulWidget {
  final Fruit? fruit;

  const EditFruitPage(this.fruit, {super.key});

  @override
  _EditFruitPageState createState() => _EditFruitPageState();
}

class _EditFruitPageState extends State<EditFruitPage> {
  late TextEditingController _jenisController;
  late TextEditingController _kaloriController;
  late TextEditingController _keteranganController;
  late TextEditingController _namaController;
  late TextEditingController _vitaminController;

  @override
  void initState() {
    super.initState();

    _jenisController = TextEditingController(text: widget.fruit?.jenis ?? '');
    _kaloriController =
        TextEditingController(text: widget.fruit?.kalori.toString() ?? '');
    _keteranganController =
        TextEditingController(text: widget.fruit?.keterangan ?? '');
    _namaController = TextEditingController(text: widget.fruit?.nama ?? '');
    _vitaminController = TextEditingController(
      text: widget.fruit?.vitamin.join(", ") ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fruit == null ? 'Add Fruit' : 'Edit Fruit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _inputNama(),
            const SizedBox(
              height: 10,
            ),
            _inputJenis(),
            const SizedBox(
              height: 10,
            ),
            _inputKalori(),
            const SizedBox(
              height: 10,
            ),
            _inputKeterangan(),
            const SizedBox(
              height: 10,
            ),
            _inputVitamin(),
            const SizedBox(height: 20),
            _buttonSave(),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buttonSave() {
    return ElevatedButton(
      onPressed: () {
        saveFruit();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kBlackColor,
      ),
      child: Text(
        widget.fruit == null ? 'Add' : 'Edit',
        style: kWhiteTextStyle,
      ),
    );
  }

  TextField _inputVitamin() {
    return TextField(
      controller: _vitaminController,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhiteGreyColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        hintText: 'Vitamin',
        hintStyle: kBlueGreyTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  TextField _inputKeterangan() {
    return TextField(
      controller: _keteranganController,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhiteGreyColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        hintText: 'Keterangan',
        hintStyle: kBlueGreyTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  TextField _inputKalori() {
    return TextField(
      controller: _kaloriController,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhiteGreyColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        hintText: 'Kalori',
        hintStyle: kBlueGreyTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  TextField _inputJenis() {
    return TextField(
      cursorColor: kBlackColor,
      controller: _jenisController,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhiteGreyColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        hintText: 'Jenis',
        hintStyle: kBlueGreyTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  TextField _inputNama() {
    return TextField(
      controller: _namaController,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhiteGreyColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        hintText: 'Nama',
        hintStyle: kBlueGreyTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Future<void> saveFruit() async {
    Fruit updatedFruit = Fruit(
      id: widget.fruit?.id ?? '',
      jenis: _jenisController.text,
      kalori: int.parse(_kaloriController.text),
      keterangan: _keteranganController.text,
      nama: _namaController.text,
      vitamin: _vitaminController.text.split(","),
    );

    if (widget.fruit == null) {
      BlocProvider.of<FruitBloc>(context).add(AddFruitEvent(updatedFruit));
    } else {
      BlocProvider.of<FruitBloc>(context).add(UpdateFruitEvent(updatedFruit));
    }

    Navigator.pop(context, true);
  }
}
