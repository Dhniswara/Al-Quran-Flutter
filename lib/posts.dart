import 'package:belajar_api/surat_detail.dart';
import 'package:flutter/material.dart';
import 'http_service.dart';
import 'Post/post_model.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Al-Quran"),
      ),
      body: FutureBuilder(
        future: httpService.getSurah(),
        builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
          if (snapshot.hasData) {
            List<Surah>? fetch = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: fetch!.length,
              itemBuilder: (BuildContext context, int index) {
                Surah tampil = fetch[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    color: Colors.blueAccent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: Text('${tampil.nomor}', style: const TextStyle(color: Colors.white),),
                      ),
                      title: Text(
                        "Surat Ke - ${tampil.nomor} ${tampil.nama_latin}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Arti: ${tampil.arti}",
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16),
                          ),
                          Text(
                            "Jumlah Ayat: ${tampil.jumlah_ayat}",
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16),                              
                          ),
                        ],
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailPage(nomor: tampil.nomor)),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}