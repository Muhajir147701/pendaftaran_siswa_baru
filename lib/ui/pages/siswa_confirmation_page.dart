part of 'pages.dart';

class SiswaConfirmationPage extends StatefulWidget {
  final SiswaRegistration siswaRegistration;

  SiswaConfirmationPage(this.siswaRegistration);
  @override
  _SiswaConfirmationPageState createState() => _SiswaConfirmationPageState();
}

class _SiswaConfirmationPageState extends State<SiswaConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    bool isRegistration = false;
    // bool isUploadfoto = false;
    return WillPopScope(
      onWillPop: () {
        context
            .read<PageBloc>()
            .add(GoToSiswaPenerimaManfaatPage(widget.siswaRegistration));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 50),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.watch<PageBloc>().add(
                                  GoToSiswaSekolahPage(
                                      widget.siswaRegistration));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                          "Konfirmasi Data\nSiswa Baru",
                          style: blackTextFont.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  label('Nama', widget.siswaRegistration.nama),
                  label('NISN', widget.siswaRegistration.nisn),
                  label('Tempat Lahir', widget.siswaRegistration.tempatLahir),
                  label('Tanggal Lahir', widget.siswaRegistration.tanggalLahir),
                  label('Asal Sekolah', widget.siswaRegistration.asalSekolah),
                  label(
                      'Alamat Sekolah', widget.siswaRegistration.alamatSekolah),
                  label('Nama Ibu', widget.siswaRegistration.namaIbu),
                  label('Nomor Hp', widget.siswaRegistration.noHpIbu),
                  label('Nama Ayah', widget.siswaRegistration.namaAyah),
                  SizedBox(
                    height: 118,
                  ),
                  (isRegistration == true)
                      ? SpinKitFadingCircle(
                          color: Color(0xFF369D9D),
                          size: 45,
                        )
                      : SizedBox(
                          height: 45,
                          width: 258,
                          child: RaisedButton(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                'Daftar Siswa',
                                style: whiteTextFont.copyWith(fontSize: 16),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isRegistration = true;
                                });

                                SiswaServices.inputSiswa(
                                    widget.siswaRegistration);
                                context.read<PageBloc>().add(GoToMainPage());
                              }),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget label(String label, String isi) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label),
            SizedBox(
              width: 6,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 75),
          child: Text(":"),
        ),
        Container(
            margin: EdgeInsets.only(left: 82), child: Text(isi.toUpperCase()))
      ],
    );
  }
}
