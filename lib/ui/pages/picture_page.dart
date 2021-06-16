part of 'pages.dart';

class PicturePage extends StatefulWidget {
  final RegistrationData registrationData;

  PicturePage(this.registrationData);
  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  bool isSignInUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToLoginPage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 22, left: 20),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<PageBloc>()
                                  .add(GoToLoginPage(widget.registrationData));
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                            child: Text(
                          "Masukkan Foto \nProfile",
                          style: blackTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 204,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 190,
                          width: 190,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (widget
                                              .registrationData.profileImage ==
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
                              if (widget.registrationData.profileImage ==
                                  null) {
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
                    height: 100,
                  ),
                  (isSignInUp)
                      ? SpinKitFadingCircle(
                          color: Color(0xFF369D9D),
                          size: 45,
                        )
                      : SizedBox(
                          height: 45,
                          width: 258,
                          child: RaisedButton(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                'Buat Akun Saya',
                                style: whiteTextFont.copyWith(fontSize: 16),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isSignInUp = true;
                                });

                                imageFileToUpload =
                                    widget.registrationData.profileImage;

                                SignUpResult result = await AuthServices.signUp(
                                  widget.registrationData.email,
                                  widget.registrationData.password,
                                  widget.registrationData.name,
                                );

                                if (result.user == null) {
                                  setState(() {
                                    isSignInUp = false;
                                  });
                                  Flushbar(
                                    duration: Duration(microseconds: 1500),
                                    backgroundColor: Colors.blueAccent,
                                    message: result.message,
                                  )..show(context);
                                }
                              }),
                        ),
                  SizedBox(
                    height: 100,
                  ),
                  FloatingActionButton(
                      child: Text("${widget.registrationData.name}"),
                      onPressed: () {})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
