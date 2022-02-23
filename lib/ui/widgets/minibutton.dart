part of 'widgets.dart';

class MiniButton extends StatelessWidget {
  final String btnName;
  final String foto;
  final Function ontap;
  final Color warna;

  MiniButton(this.btnName, this.foto, this.ontap, this.warna);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ImageViewer(foto)));
      },
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: warna,
        ),
        child: Center(child: Text(btnName)),
      ),
    );
  }
}
