part of 'pages.dart';

class SiswaOrangTuaPage extends StatefulWidget {
  final SiswaRegistration siswaRegistration;

  SiswaOrangTuaPage(this.siswaRegistration);
  @override
  _SiswaOrangTuaPageState createState() => _SiswaOrangTuaPageState();
}

class _SiswaOrangTuaPageState extends State<SiswaOrangTuaPage> {
  TextEditingController namaIbuController = TextEditingController();
  TextEditingController alamatIbuController = TextEditingController();
  TextEditingController namaAyahController = TextEditingController();
  TextEditingController noHpIbuController = TextEditingController();
  TextEditingController noHpAyahController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .read<PageBloc>()
            .add(GoToSiswaSekolahPage(widget.siswaRegistration));

        return;
      },
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: 25, left: defaultMargin, right: defaultMargin),
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(
                            GoToSiswaSekolahPage(widget.siswaRegistration));
                      },
                      child: Icon(Icons.arrow_back)),
                  Align(
                    child: Text("Informasi Orang Tua",
                        style: blackTextFont.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: [
                  fieldText("Nama Ibu", "Masukkan Nama Ibu", namaIbuController),
                  fieldText(
                      "Alamat Ibu", "Masukkan Alamat Ibu", alamatIbuController),
                  fieldText(
                      "No Hp Ibu", "Masukkan No Hp Ibu", noHpIbuController),
                  fieldText(
                      "Nama Ayah", "Masukkan Nama  Ayah", namaAyahController),
                  fieldText(
                      "No Hp Ayah", "Masukkan No Hp Ayah", noHpAyahController),
                  SizedBox(height: 40),
                  FloatingActionButton(
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
                        widget.siswaRegistration.namaIbu =
                            namaIbuController.text;
                        widget.siswaRegistration.alamatIbu =
                            alamatIbuController.text;
                        widget.siswaRegistration.noHpIbu =
                            noHpIbuController.text;
                        widget.siswaRegistration.namaAyah =
                            namaAyahController.text;

                        context.read<PageBloc>().add(
                            GoToSiswaPenerimaManfaatPage(
                                widget.siswaRegistration));
                      })
                ],
              ),
            )
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
