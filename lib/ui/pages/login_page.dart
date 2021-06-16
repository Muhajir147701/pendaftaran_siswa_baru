part of 'pages.dart';

class LoginPage extends StatefulWidget {
  final RegistrationData registrationData;
  LoginPage(this.registrationData);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    // PageState pageState = context.watch<PageBloc>().state;// percobaan penggunaan watch
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white24,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 22),
                  height: 56,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.read<PageBloc>().add(GoToSplashPage());
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                          child: Text(
                        "Buat Akun Baru",
                        style: blackTextFont.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  height: 104,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (widget.registrationData.profileImage ==
                                        null)
                                    ? AssetImage("assets/icon/user_pic.png")
                                    : FileImage(
                                        widget.registrationData.profileImage),
                                fit: BoxFit.cover)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                            if (widget.registrationData.profileImage == null) {
                              widget.registrationData.profileImage =
                                  await getsImage();
                            } else {
                              widget.registrationData.profileImage = null;
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage((widget.registrationData
                                                .profileImage ==
                                            null)
                                        ? "assets/icon/btn_add_photo.png"
                                        : "assets/icon/btn_del_photo.png"))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Nama",
                      hintText: "Masukkan Nama"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Email",
                      hintText: "Email "),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password",
                      hintText: "Password"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: retypePasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Confirm Password ",
                      hintText: "Confirm Password"),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            FloatingActionButton(
              onPressed: () async {
                if (!(nameController.text.trim() != "" &&
                    emailController.text.trim() != "" &&
                    passwordController.text.trim() != "" &&
                    retypePasswordController.text.trim() != "")) {
                  Flushbar(
                    duration: Duration(milliseconds: 1500),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Color(0xFFFF5c83),
                    message: "Silahkan mengisi semua formulir",
                  )..show(context);
                } else if (passwordController.text !=
                    retypePasswordController.text) {
                  Flushbar(
                    duration: Duration(milliseconds: 1500),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Color(0xFFFF5c83),
                    message: "Pasword yang diketikkan tidak sama",
                  )..show(context);
                } else if (!EmailValidator.validate(emailController.text)) {
                  Flushbar(
                    duration: Duration(milliseconds: 1500),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Color(0xFFFF5c83),
                    message: "Format Emailnya belum benar!",
                  )..show(context);
                } else {
                  widget.registrationData.name = nameController.text;
                  widget.registrationData.email = emailController.text;
                  widget.registrationData.password = passwordController.text;

                  context
                      .read<PageBloc>()
                      .add(GoToPicturePage(widget.registrationData));
                  print("gagal");
                }
              },
              child: Icon(Icons.arrow_forward),
            ),
            SizedBox(
              height: 60,
            )
          ]),
        ),
      ),
    );
  }
}
