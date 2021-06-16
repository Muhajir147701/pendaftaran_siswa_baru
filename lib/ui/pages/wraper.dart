part of 'pages.dart';

class Wraper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    auth.User firebaseUser = Provider.of<auth.User>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.read<UserBloc>().add(LoadUser(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(prevPageEvent);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? LoginPage(pageState.registrationData)
                : (pageState is OnPicturePage)
                    ? PicturePage(pageState.registrationData)
                    : (pageState is OnSignInPage)
                        ? SignInPage()
                        : (pageState is OnAddSiswaPage)
                            ? AddSiswa(pageState.siswaRegistration)
                            : (pageState is OnSiswaOrangTuaPage)
                                ? SiswaOrangTuaPage(pageState.siswaRegistration)
                                : (pageState is OnSiswaSekolahPage)
                                    ? SiswaSekolahPage(
                                        pageState.siswaRegistration)
                                    : (pageState is OnSiswaPenerimaManfaatPage)
                                        ? SiswaPenerimaManfaatPage(
                                            pageState.siswaRegistration)
                                        : (pageState is OnSiswaConfirmationPage)
                                            ? (SiswaConfirmationPage(
                                                pageState.siswaRegistration))
                                            : (pageState is OnSiswaDetailPage)
                                                ? SiswaDetailPage(
                                                    pageState.siswa)
                                                : MainPage());
  }
}
