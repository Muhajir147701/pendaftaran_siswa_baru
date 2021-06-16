part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSignginIn = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: 70,
          ),
          child: ListView(
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  setState(() {
                    isEmailValid = EmailValidator.validate(text);
                  });
                },
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Email",
                    hintText: "Masukkan Email"),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (text) {
                  setState(() {
                    isPasswordValid = text.length >= 4;
                  });
                },
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Password",
                    hintText: "Masukkan Password"),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 45,
                width: 258,
                child: RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Login',
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                  onPressed: isEmailValid && isPasswordValid
                      ? () async {
                          SignUpResult result = await AuthServices.signIn(
                              emailController.text, passwordController.text);

                          if (result.user == null) {
                            setState(() {
                              isSignginIn = false;
                            });
                            Flushbar(
                              duration: Duration(seconds: 4),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: result.message,
                            )..show(context);
                          }
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
