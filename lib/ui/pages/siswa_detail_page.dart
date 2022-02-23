part of 'pages.dart';

class SiswaDetailPage extends StatefulWidget {
  final Siswa siswa;

  SiswaDetailPage(this.siswa);
  @override
  _SiswaDetailPageState createState() => _SiswaDetailPageState();
}

class _SiswaDetailPageState extends State<SiswaDetailPage> {
  @override
  Widget build(BuildContext context) {
    Siswa siswa = widget.siswa;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: SizedBox(),
              ),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/picture/Latar.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0, 1),
                        end: Alignment(0, 0.06),
                        colors: [Colors.white, Colors.white.withOpacity(0)]),
                  ),
                ),
              ),
            ],
          ),
          ListView(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 300),
                height: double.maxFinite,
                // color: Colors.blueGrey,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70)),
                    color: Colors.grey[400]),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 50, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          label('Asal Sekolah', siswa.asalSekolah ?? "",
                              Icons.bookmark_border),
                          label('N I S N     ', siswa.nisn ?? "",
                              Icons.bookmark_border),
                          label('Tempat Lahir', siswa.tempatLahir ?? "",
                              Icons.confirmation_number_outlined),
                          label('Tanggal Lahir', siswa.tanggalLahir ?? "",
                              Icons.date_range_outlined),
                          label('Nama Ibu       ', siswa.namaIbu ?? "",
                              Icons.pregnant_woman),
                          label('Nomor HP Ibu      ', siswa.noHpIbu ?? "",
                              Icons.verified_user_outlined),
                          label('Nama Ayah      ', siswa.namaAyah ?? "",
                              Icons.verified_user_outlined),
                          label('Alamat Sekolah', siswa.alamatSekolah,
                              Icons.home_outlined),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MiniButton('KK', siswa.sktm, () {}, Colors.amber),
                              MiniButton('KIP', siswa.kip, () {}, Colors.red),
                              MiniButton(
                                  'Rapor', siswa.ketLain, () {}, Colors.blue),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 45,
                            width: 200,
                            child: GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToMainPage());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                    ),
                                    color: Colors.blue[700]),
                                child: Center(
                                  child: Text(
                                    'Kembali',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              height: 45,
              width: 250,
              margin: EdgeInsets.only(bottom: 50, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber.withOpacity(0.9)),
              child: Row(
                children: [
                  Container(
                    height: 43,
                    width: 43,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: (siswa.foto != "")
                              ? NetworkImage(siswa.foto)
                              : AssetImage("assets/icon/user_pic.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 200,
                    child: Center(
                        child: Text(
                      siswa.nama.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: defaultMargin, top: 80),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: (siswa.foto != "")
                        ? NetworkImage(siswa.foto)
                        : AssetImage("assets/icon/user_pic.png"),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }

  Widget label(String label, String text, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Text(text)
          ],
        ),
        Spacer(),
        Icon(
          iconData,
          size: 16,
          color: Colors.blue,
        )
      ],
    );
  }
}
