part of 'pages.dart';

class Coba2 extends StatefulWidget {
  static FirebaseFirestore firestore1 = FirebaseFirestore.instance;
  static CollectionReference siswas = firestore1.collection('siswa');

  @override
  _Coba2State createState() => _Coba2State();
}

class _Coba2State extends State<Coba2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
        User user = (userState as UserLoaded).user;

        return Expanded(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: defaultMargin, top: 10),
                child: Text(
                  'Yang Diinput oleh : ${user.name}',
                  style: blackTextFont.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FutureBuilder<QuerySnapshot>(
                  future: Coba2.siswas
                      .where('idrecomended', isEqualTo: user.id)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.docs
                            .map((e) => SiswaCard(
                                    e.data()['nama'],
                                    e.data()['asalSekolah'],
                                    e.data()['foto'], onDelete: () {
                                  Coba2.siswas.doc(e.id).delete();
                                  setState(() {});
                                }))
                            .toList(),
                      );
                    } else {
                      return Text("Data Loading");
                    }
                  })
            ],
          ),
        );
      }),
    );
  }
}
