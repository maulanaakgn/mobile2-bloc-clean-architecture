import 'package:flutter/material.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/shared/themes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _avatar(),
            const SizedBox(
              height: 25,
            ),
            _nama(),
            _nim(),
            _kelas(),
          ],
        ),
      ),
    );
  }

  CircleAvatar _avatar() {
    return const CircleAvatar(
            radius: 75,
            backgroundImage: NetworkImage(
              'https://i.ytimg.com/vi/GdPEHKnGrdA/maxresdefault.jpg',
            ),
          );
  }

  Text _nama() {
    return Text(
          'Azki Maulana Assariy',
          style: kBlackTextStyle.copyWith(fontSize: 18,),
                      );
  }

  Text _nim() {
    return Text(
          '21552011144',
          style: kBlackTextStyle.copyWith(fontSize: 18,),
                      );
  }

  Text _kelas() {
    return Text(
          'TIF 221B',
          style: kBlackTextStyle.copyWith(fontSize: 18,),
                      );
  }
}