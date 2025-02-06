import 'dart:convert';
import 'package:http/http.dart';
import 'Post/post_model.dart';

class HttpService {
  final String postsURL = "https://quran-api.santrikoding.com/api/surah";

  Future<List<Surah>> getSurah() async {
    Response res = await get(Uri.parse(postsURL));
    
    if (res.statusCode == 200) {

      List<dynamic> body = jsonDecode(res.body);
        
      List<Surah> surahList = body.map((dynamic item) => Surah.fromJson(item)).toList();
      
      return surahList;
    } else {
      throw "Unable to retrieve surah.";
    }
  }

  Future<Surah> getSurahByNumber(int nomor) async {
    Response res = await get(Uri.parse("$postsURL/$nomor"));

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      return Surah.fromJson(body);
    } else {
      throw Exception("Gagal mengambil surah dengan nomor.");
    }
  }
}
