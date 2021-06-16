part of 'models.dart';

class SiswaRegistration {
  String nama,
      recomended,
      nisn,
      alamat,
      tempatLahir,
      namaAyah,
      namaIbu,
      alamatIbu,
      asalSekolah,
      alamatSekolah,
      noHpIbu;

  String tanggalLahir, kip, sktm, ketlain, foto;

  SiswaRegistration(
      {this.nama,
      this.recomended,
      this.nisn,
      this.alamat,
      this.tempatLahir,
      this.tanggalLahir,
      this.alamatIbu,
      this.asalSekolah,
      this.alamatSekolah,
      this.namaAyah,
      this.namaIbu,
      this.kip,
      this.ketlain,
      this.sktm,
      this.noHpIbu});

  SiswaRegistration copyWith({
    String nama,
    String alamat,
    String tempatLahir,
    namaAyah,
    namaIbu,
    alamatIbu,
    asalSekolah,
    alamatSekolah,
    noHpIbu,
    tanggalLahir,
    kip,
    sktm,
    ketlain,
  }) {
    return SiswaRegistration(
        nama: nama ?? this.nama,
        nisn: nisn ?? this.nisn,
        alamat: alamat ?? this.alamat,
        namaAyah: namaAyah ?? this.namaAyah,
        namaIbu: namaIbu ?? this.namaIbu,
        alamatIbu: alamatIbu ?? this.alamatIbu,
        asalSekolah: asalSekolah ?? this.asalSekolah,
        alamatSekolah: alamatSekolah ?? this.alamatSekolah,
        noHpIbu: noHpIbu ?? this.noHpIbu,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        kip: kip ?? this.kip,
        sktm: sktm ?? this.sktm,
        ketlain: ketlain ?? this.ketlain);
  }
}
// TODO: PENAMBAHAN DETIL SISWA
