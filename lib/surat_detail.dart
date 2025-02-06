import 'package:flutter/material.dart';
import 'http_service.dart';
import 'Post/post_model.dart';

class DetailPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  final int nomor;

  DetailPage({required this.nomor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Surah"),
      ),
      body: FutureBuilder(
        future: httpService.getSurahByNumber(nomor),
        builder: (BuildContext context, AsyncSnapshot<Surah> snapshot) {
          if (snapshot.hasData) {
            Surah tampil = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child:  Text(
                        "${tampil.nomor}. ${tampil.nama_latin}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                      ),
                  ),
                 
                  SizedBox(height: 10),
                  if (tampil.ayat != null)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tampil.ayat!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Ayat ayat = tampil.ayat![index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ayat ${ayat.nomor}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(height: 10),
                                
                                Text(
                                  ayat.ar,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  ayat.idn,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
