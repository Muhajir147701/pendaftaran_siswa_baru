import 'package:flutter_test/flutter_test.dart';
import 'package:pendaftaran_siswa_baru/ui/pages/pages.dart';

void main() {
  Wraper w;
  w = Wraper();
  test("Ininsialisasi Objek Person", () {
    expect(w.key, equals("noname"));
  });
}
