part of 'pages.dart';

class Coba1 extends StatelessWidget {
  static FirebaseFirestore firestore1 = FirebaseFirestore.instance;
  static CollectionReference siswas = firestore1.collection('siswa');
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
      //   User user = (userState as UserLoaded).user;

      //   return Expanded(
      child: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: siswas.orderBy('nama').snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.docs
                        .map((e) => SiswaCard(
                              e.data()['nama'],
                              e.data()['asalSekolah'],
                              e.data()['foto'],
                              goDetil: () {
                                context
                                    .read<PageBloc>()
                                    .add(GoToSiswaDetailPage(e.id));
                              },
                              onDelete: () {
                                siswas.doc(e.id).delete();
                              },
                            ))
                        .toList(),
                  );
                } else {
                  return Text("user.name");
                }
              })
        ],
      ),
    );
    // }),
    // );
  }
}
