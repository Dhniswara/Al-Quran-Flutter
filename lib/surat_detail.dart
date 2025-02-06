import 'package:belajar_api/Post/post_model.dart';
import 'package:flutter/material.dart';

class SurahDetail extends StatelessWidget {
  final Surah surah;

  SurahDetail({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Surah'),
        ),

        body: SingleChildScrollView(
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text("Ayat:  ${surah.jumlah_ayat}"),
              ),
            ),
        ),
      );
  }
}