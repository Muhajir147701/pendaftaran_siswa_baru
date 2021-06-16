part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((downloadURL) {
                  imageFileToUpload = null;
                  context
                      .read<UserBloc>()
                      .add(UserUpdateData(profileImage: downloadURL));
                });
              }

              return Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        image: DecorationImage(
                            image: (userState.user.profilePicture == "")
                                ? AssetImage("assets/icon/user_pic.png")
                                : NetworkImage(userState.user.profilePicture),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    userState.user.name,
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              );
            } else {
              return SpinKitFadingCircle(
                color: accentColor2,
                size: 50,
              );
            }
          }),
          actions: [
            GestureDetector(
                onTap: () {
                  AuthServices.signOut();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ))
          ],
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            context.read<PageBloc>().add(GoToAddSiswaPage(SiswaRegistration()));
          },
        ),
        body: PageView(
          children: [Coba1(), Coba2()],
        )
        
        );
  }
}
