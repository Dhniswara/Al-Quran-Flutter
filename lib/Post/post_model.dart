class Surah {
  final int nomor;
  final String nama;
  final String nama_latin;
  final int jumlah_ayat;
  final String tempat_turun;
  final String arti;
  final String deskripsi;
  final List<Ayat>?ayat;
  // final int id;
  // final String surah;
  // // final int nomor;
  // final String ar;
  // final String tr;

  Surah({
    required this.nomor,
    required this.nama,
    required this.nama_latin,
    required this.jumlah_ayat,
    required this.tempat_turun,
    required this.arti,
    required this.deskripsi,
    this.ayat,
    // required this.id,
    // required this.surah,
    // required this.ar,
    // required this.tr
  });
  

  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayatList = json['ayat'] as List?;
    List<Ayat>? ayat = ayatList?.map((i) => Ayat.fromJson(i)).toList();
    
    return Surah(
      nomor: json['nomor'] as int,
      nama: json['nama'] as String,
      nama_latin: json['nama_latin'] as String,
      jumlah_ayat: json['jumlah_ayat'] as int ,
      tempat_turun: json['tempat_turun'] as String,
      arti: json['arti'] as String,
      deskripsi: json['deskripsi'] as String,
      ayat: ayat,
      // ayat: json['ayat'] as String,
    );
  }
}

class Ayat {
  final int nomor;
  final String ar;
  final String tr;
  final String idn;


  Ayat ({
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomor: json['nomor'] as int,
      ar: json['ar'] as String,
      tr: json['tr'] as String,
      idn: json['idn'] as String,
      
      // ayat: json['ayat'] as String,
    );
  }


}