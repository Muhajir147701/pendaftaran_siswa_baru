part of 'pages.dart';

class SiswaPenerimaManfaatPage extends StatefulWidget {
  final SiswaRegistration siswaRegistration;

  SiswaPenerimaManfaatPage(this.siswaRegistration);

  @override
  _SiswaPenerimaManfaatPageState createState() =>
      _SiswaPenerimaManfaatPageState();
}

class _SiswaPenerimaManfaatPageState extends State<SiswaPenerimaManfaatPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToSiswaOrangTuaPage(widget.siswaRegistration));
        return;
      },
      child: Scaffold(
          body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // SafeArea(child: null),
              Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: defaultMargin,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(
                            GoToSiswaOrangTuaPage(widget.siswaRegistration));
                      },
                      child: Icon(Icons.arrow_back))),
              Center(
                child: Text(
                  "Informasi Penerima \nTunjangan Pemerintah",
                  style: blackTextFont.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            width: 300,
            margin: EdgeInsets.only(
              left: defaultMargin,
              top: 20,
              right: defaultMargin,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.black)),
                          child: (sktm != null)
                              ? Image.file(sktm, fit: BoxFit.cover)
                              : SizedBox(),
                        ),
                        RaisedButton(
                            child:
                                Text((sktm != null) ? "Hapus" : "Upload SKTM"),
                            onPressed: () async {
                              if (sktm != null) {
                                sktm = null;
                                setState(() {});
                              } else {
                                sktm = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CameraPage()));
                                setState(() {});
                              }
                            }),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.black)),
                          child: (kipFile != null)
                              ? Image.file(kipFile, fit: BoxFit.cover)
                              : SizedBox(),
                        ),
                        RaisedButton(
                            child: Text(
                                (kipFile != null) ? "Hapus" : "Upload KIP"),
                            onPressed: () async {
                              if (kipFile != null) {
                                kipFile = null;
                                setState(() {});
                              } else {
                                kipFile = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CameraPage()));
                                setState(() {});
                              }
                            }),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black)),
                      child: (ketLain != null)
                          ? Image.file(
                              ketLain,
                              fit: BoxFit.cover,
                            )
                          : SizedBox(
                              child: Center(
                                child: Text('gambar belum terapload'),
                              ),
                            ),
                    ),
                    RaisedButton(
                        child: Text(
                          (ketLain != null) ? 'hapus' : "Upload Ket\nLain",
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async {
                          if (ketLain != null) {
                            ketLain = null;
                            setState(() {});
                          } else {
                            ketLain = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CameraPage()));
                            setState(() {});
                          }
                        }),
                  ],
                ),
                SizedBox(height: 40),
                FloatingActionButton(
                    heroTag: 'pindah dan simpan',
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                       if (fotoSiswa != null) {
                            uploadImage(fotoSiswa).then((downloadURL) {
                              fotoSiswa = null;
                              widget.siswaRegistration.foto = downloadURL;
                            });
                          }
                      if (kipFile != null) {
                        uploadImage(kipFile).then((downloadURL) {
                          kipFile = null;
                          widget.siswaRegistration.kip = downloadURL;
                        });
                      }
                      if (sktm != null) {
                        uploadImage(sktm).then((downloadURL1) {
                          sktm = null;
                          widget.siswaRegistration.sktm = downloadURL1;
                        });
                      }
                      if (ketLain != null) {
                        uploadImage(sktm).then((downloadURL2) {
                          ketLain = null;
                          widget.siswaRegistration.ketlain = downloadURL2;
                        });
                      }

                      context.read<PageBloc>().add(
                          GoToSiswaConfirmationPage(widget.siswaRegistration));
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      )),
    );
  }
}
