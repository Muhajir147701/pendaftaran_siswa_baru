part of 'services.dart';

class SiswaServices {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference siswaCollection = firestore.collection('siswa');

  Stream collectionStream =
      FirebaseFirestore.instance.collection('siswa').snapshots();
  Stream documentStream =
      FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

  static Future<void> inputSiswa(SiswaRegistration siswa) async {
    try {
      await siswaCollection.add({
        'idrecomended': siswa.recomended,
        'nama': siswa.nama ?? "",
        'nisn': siswa.nisn ?? "",
        'namaIbu': siswa.namaIbu ?? "",
        'noHpIbu': siswa.noHpIbu ?? "",
        'namaAyah': siswa.namaAyah ?? "",
        'asalSekolah': siswa.asalSekolah ?? "",
        'noHpWali': siswa.asalSekolah ?? "",
        'tempatLahir': siswa.tempatLahir ?? "",
        'tanggalLahir': siswa.tanggalLahir ?? "",
        'alamatSekolah': siswa.alamatSekolah ?? "",
        'kip': siswa.kip ?? "",
        'ketLain': siswa.ketlain ?? "",
        'sktm': siswa.sktm ?? "",
        'foto': siswa.foto ?? ""
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<Siswa> getSiswa(String id) async {
    DocumentSnapshot snapshot = await siswaCollection.doc(id).get();

    return Siswa(
        nama: snapshot.data()['nama'],
        nisn: snapshot.data()['nisn'],
        asalSekolah: snapshot.data()['asalSekolah'],
        namaIbu: snapshot.data()['namaIbu'],
        noHpIbu: snapshot.data()['noHpIbu'],
        namaAyah: snapshot.data()['namaAyah'],
        tempatLahir: snapshot.data()['tempatLahir'],
        tanggalLahir: snapshot.data()['tanggalLahir'],
        alamatSekolah: snapshot.data()['alamatSekolah'],
        kip: snapshot.data()['kip'],
        ketLain: snapshot.data()['ketLain'],
        sktm: snapshot.data()['sktm'],
        foto: snapshot.data()['foto']);
  }
}
