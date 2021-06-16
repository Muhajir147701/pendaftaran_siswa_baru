part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Splash Page"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/picture/logo-asadiyah-baru.png"),
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70, bottom: 16),
                  child: Text(
                    "Formulir Pendaftaran\nMTs As'adiyah Putri 2",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Divider(),
            Container(
              width: 250,
              height: 46,
              color: Colors.purple,
              child: RaisedButton(
                child: Text(
                  "Daftar Cepat",
                  style: whiteTextFont.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                color: accentColor1,
                onPressed: () {
                  AuthServices.signIn("damad@gmail.com", "123456");
                },
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Untuk mendaftar silahkan",
                  style: greyTextFont,
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<PageBloc>()
                        .add(GoToLoginPage(RegistrationData()));
                  },
                  child: Text(
                    " Login Page",
                    style: blackTextFont,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sudah punya Akun",
                  style: greyTextFont,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<PageBloc>().add(GoToSignInPage());
                  },
                  child: Text(
                    " Sign In Page",
                    style: blackTextFont,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
