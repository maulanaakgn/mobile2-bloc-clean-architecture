import 'package:flutter/material.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/shared/themes.dart';

class ListScreenPage extends StatefulWidget {
  const ListScreenPage({Key? key}) : super(key: key);

  @override
  State<ListScreenPage> createState() => _ListScreenPageState();
}

class _ListScreenPageState extends State<ListScreenPage> {
  List<String> _filteredList = [];
  String _keywords = '';
  final List<String> _originList = [
    "Apel",
    "Pisang",
    "Ceri",
    "Durian",
    "Elderberi",
    "Kelengkeng",
    "Anggur",
    "Buah Naga",
    "Nangka",
    "Kiwi",
    "Lemon",
    "Mangga",
    "Nektarin",
    "Jeruk",
    "Pepaya",
    "Raspberry",
    "Stroberi",
    "Jeruk Bali",
    "Nanas",
    "Semangka",
    "Melon",
    "Buah passion kuning",
    "Zukini"
  ];

  final TextEditingController _searchController = TextEditingController();

  _buildOriginList() {
    List<String> displayList = _keywords.isEmpty
        ? _originList
        : _filteredList.isNotEmpty
            ? _filteredList
            : ['Tidak ditemukan'];

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              displayList[index],
              style: kBlackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          height: 2,
          color: kBlackColor,
        ),
        itemCount: displayList.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredList = _originList;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _keywords = _searchController.text.toLowerCase();
      _filteredList = _originList
          .where((item) => item.toLowerCase().contains(_keywords))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _search(),
          const SizedBox(height: 10,),
          _buildOriginList(),
        ],
      ),
    );
  }

  TextField _search() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhiteGreyColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: kBlackColor,
        ),
        hintText: 'Search',
        hintStyle: kBlueGreyTextStyle.copyWith(
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
