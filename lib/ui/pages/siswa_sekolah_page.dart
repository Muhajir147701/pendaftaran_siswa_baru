part of 'pages.dart';

class SiswaSekolahPage extends StatefulWidget {
  final SiswaRegistration siswaRegistration;

  SiswaSekolahPage(this.siswaRegistration);
  @override
  _SiswaSekolahPageState createState() => _SiswaSekolahPageState();
}

class _SiswaSekolahPageState extends State<SiswaSekolahPage> {
  TextEditingController asalSekolahController = TextEditingController();
  TextEditingController alamatSekolahController = TextEditingController();
  TextEditingController alamatSekolahKecController = TextEditingController();
  TextEditingController alamatSekolahKabController = TextEditingController();
  TextEditingController alamatSekolahProvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .read<PageBloc>()
            .add(GoToAddSiswaPage(widget.siswaRegistration));
        return;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            top: 25, left: defaultMargin, right: defaultMargin),
                        child: GestureDetector(
                            onTap: () {
                              context.read<PageBloc>().add(
                                  GoToAddSiswaPage(widget.siswaRegistration));
                            },
                            child:
                                Icon(Icons.arrow_back, color: Colors.black))),
                    Container(
                        margin: EdgeInsets.only(
                            top: 25, left: defaultMargin, right: defaultMargin),
                        child: Center(
                          child: Text("Informasi Sekolah \nAsal",
                              style: blackTextFont.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center),
                        )),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: 85, left: defaultMargin, right: defaultMargin),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        fieldText("Asal Sekolah", "Masukkan Asal Sekolah",
                            asalSekolahController),
                        SizedBox(
                          height: 16,
                        ),
                        fieldText("Alamat Sekolah", "Masukkan Alamat Sekolah",
                            alamatSekolahController),
                        fieldText("Alamat Sekolah Kecamatan",
                            "Masukkan Kecamatan", alamatSekolahKecController),
                        fieldText(
                            "Alamat Sekolah Kabupaten",
                            "Masukkan Masukkan Kabupaten",
                            alamatSekolahKabController),
                        fieldText(
                            "Alamat Sekolah Provinsi",
                            "Masukkan Masukkan Provinsi",
                            alamatSekolahProvController),
                      ],
                    )),
                SizedBox(
                  height: 40,
                ),
                FloatingActionButton(
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      widget.siswaRegistration.asalSekolah =
                          asalSekolahController.text;
                      widget.siswaRegistration.alamatSekolah =
                          alamatSekolahController.text +
                              ',' +
                              alamatSekolahKecController.text +
                              ',' +
                              alamatSekolahKabController.text +
                              ',' +
                              alamatSekolahProvController.text;

                      // print(widget.siswaRegistration.nama);

                      context
                          .read<PageBloc>()
                          .add(GoToSiswaOrangTuaPage(widget.siswaRegistration));
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget fieldText(
      String labelText, String hintText, TextEditingController controller) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
