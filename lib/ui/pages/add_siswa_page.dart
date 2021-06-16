part of 'pages.dart';

class AddSiswa extends StatefulWidget {
  final SiswaRegistration siswaRegistration;

  AddSiswa(this.siswaRegistration);
  @override
  _AddSiswaState createState() => _AddSiswaState();
}

class _AddSiswaState extends State<AddSiswa> {
  final TextEditingController namaController = TextEditingController();

  final TextEditingController nisnController = TextEditingController();

  final TextEditingController noHpWaliController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  var dateTime;

  DateTime _currenDate = DateTime.now();
  Future<DateTime> selectdate(BuildContext context) async {
    // String _formatDate = DateFormat.yMMMEd().format(_currenDate);
    final DateTime seldate = await showDatePicker(
      context: context,
      initialDate: _currenDate,
      firstDate: DateTime(2007),
      lastDate: DateTime(2030),
      // locale: Locale('id', 'ID')

      // builder: (context, child) => SingleChildScrollView(
      //       child: child,
      //     )
    );

    // if (seldate != null) {
    //   setState(() {
    //     _currenDate = seldate;
    //   });
    // }
    return seldate;
  }

  @override
  void initState() {
    super.initState();
    namaController.text = widget.siswaRegistration.nama;
    nisnController.text = widget.siswaRegistration.nisn;
    tempatLahirController.text = widget.siswaRegistration.tempatLahir;
    tanggalLahirController.text = widget.siswaRegistration.tanggalLahir;
  }

  @override
  Widget build(BuildContext context) {
    // String _formatDate = DateFormat.yMMMMEEEEd().format(_currenDate);
    // bool isNameValid = false;

    bool isAsalSekolahValid = false;

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      context.read<PageBloc>().add(GoToMainPage());
                    },
                    child: Icon(Icons.arrow_back_rounded)),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Tambah Siswa",
                  style: blackTextFont.copyWith(fontSize: 18),
                ),
              ],
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    AuthServices.signOut();
                  },
                  child: Icon(Icons.close))
            ],
          ),
          body: Stack(
            children: <Widget>[
              BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                User user = (userState as UserLoaded).user;

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: ListView(children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: 155,
                        height: 164,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (fotoSiswa == null)
                                          ? AssetImage(
                                              "assets/icon/user_pic.png")
                                          : FileImage(fotoSiswa),
                                      fit: BoxFit.cover)),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () async {
                                  if (fotoSiswa != null) {
                                    fotoSiswa = null;
                                  } else {
                                    fotoSiswa = await getsImage();
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage((fotoSiswa == null)
                                              ? "assets/icon/btn_add_photo.png"
                                              : "assets/icon/btn_del_photo.png"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    fieldText("Nama", "Masukkan Nama", namaController),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isAsalSekolahValid = text.length >= 2;
                          print(isAsalSekolahValid);
                        });
                      },
                      controller: nisnController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "NISN",
                          hintText: "Masukkan N I S N"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    fieldText("Tempat Lahir", "masukkan Tempat Lahir",
                        tempatLahirController),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: tanggalLahirController,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () async {
                                selectdate(context).then((data) {
                                  String _formatDate =
                                      DateFormat.yMMMMEEEEd().format(data);
                                  tanggalLahirController.text = _formatDate;
                                  setState(() {});
                                });
                              },
                              child: Icon(Icons.date_range)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Tanggal Lahir",
                          labelText: "Masukkan tanngal Lahir"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    FloatingActionButton(
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {
                         

                          widget.siswaRegistration.nama =
                              namaController.text.toUpperCase();
                          widget.siswaRegistration.nisn = nisnController.text;
                          widget.siswaRegistration.tempatLahir =
                              tempatLahirController.text;

                          widget.siswaRegistration.recomended = user.id;
                          widget.siswaRegistration.tanggalLahir =
                              tanggalLahirController.text;

                          context.read<PageBloc>().add(
                              GoToSiswaSekolahPage(widget.siswaRegistration));
                        }),
                    SizedBox(
                      height: 60,
                    ),
                  ]),
                );
              }),
            ],
          )),
    );
  }

  Widget fieldText(
      String labelText, String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
