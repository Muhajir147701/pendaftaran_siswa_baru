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
                  "Form Informasi \nTambahan Documen",
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
                              : GestureDetector(
                                  onTap: () async {
                                    sktm = await getsImage();
                                    setState(() {});
                                  },
                                  child: SizedBox(
                                    child: Center(
                                      child: Text(
                                        'no Image',
                                        style: greyTextFont,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        RaisedButton(
                            child: Text((sktm != null) ? "Hapus" : "Upload KK"),
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
                              : GestureDetector(
                                  onTap: () async {
                                    kipFile = await getsImage();
                                    setState(() {});
                                  },
                                  child: SizedBox(
                                    child: Center(
                                      child: Text(
                                        'no Image',
                                        style: greyTextFont,
                                      ),
                                    ),
                                  ),
                                ),
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
                          : GestureDetector(
                              onTap: () async {
                                ketLain = await getsImage();
                                setState(() {});
                              },
                              child: SizedBox(
                                child: Center(
                                  child: Text(
                                    'Tap to Add \nFrom Galery!',
                                    style: greyTextFont,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      width: 120,
                      child: RaisedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera),
                              Text(
                                (ketLain != null)
                                    ? 'Hapus'
                                    : "halaman I\n Raport",
                                textAlign: TextAlign.center,
                              ),
                            ],
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
                    ),
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
                        uploadImage(ketLain).then((downloadURL2) {
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
