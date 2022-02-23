part of 'widgets.dart';

class SiswaCard extends StatelessWidget {
  final String nama, asalSekolah;

  final Function onDelete;
  final Function goDetil;
  final String foto;

  SiswaCard(this.nama, this.asalSekolah, this.foto,
      {this.goDetil, this.onDelete});
  @override
  // var lebarLayar= MediaQuery.of(context).with;
  Widget build(BuildContext context) {
    double lebar = 50;

    return Column(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width - 2 * defaultMargin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.21),
                    Colors.black.withOpacity(0.31)
                  ])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        lebar = 100;
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 5),
                        width: lebar,
                        height: lebar,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (foto != "")
                                    ? NetworkImage(foto)
                                    : AssetImage("assets/icon/user_pic.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        goDetil();
                      },
                      child: Container(
                        width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nama,
                              overflow: TextOverflow.ellipsis,
                              style: blackTextFont.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: accentColor1,
                              ),
                            ),
                            Text(asalSekolah)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        if (goDetil != null) {
                          goDetil();
                        }
                      },
                      child: Icon(Icons.edit)),
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.WARNING,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Hapus Siswa',
                          desc: 'Apakah Anda Mau Menghapus $nama?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            if (onDelete != null) {
                              onDelete();
                            }
                          },
                        )..show();
                      },
                      child: Icon(
                        Icons.delete,
                        color: (onDelete != null) ? Colors.red : Colors.grey,
                      ))
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3,
        )
      ],
    );
  }
}
