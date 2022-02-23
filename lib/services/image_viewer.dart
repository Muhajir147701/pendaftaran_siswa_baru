part of 'services.dart';

class ImageViewer extends StatefulWidget {
  final String foto;

  ImageViewer(this.foto);

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    var networkImage = NetworkImage(widget.foto);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SafeArea(
                child: SizedBox(
              height: 20,
            )),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: PhotoView(
                imageProvider: (widget.foto == "")
                    ? AssetImage("assets/icon/user_pic.png")
                    : networkImage,
                // : NetworkImage(widget.foto),
                maxScale: PhotoViewComputedScale.covered * 2,
                minScale: 0.5,
                enableRotation: true,
                backgroundDecoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            //
            RaisedButton(
                child: Text('Kembali'),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
