import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/sub_service.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  List<SubService> subServiceList;
  MapScreen(this.subServiceList);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMapPin();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(widget.subServiceList[0].latitude.toString()), double.parse(widget.subServiceList[0].longitude.toString())),
      zoom: 14.4746,
    );
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorResources.white,
          ),
        ),
        backgroundColor: ColorResources.themered,
        title: Text(
          'Services',
          style: TextStyle(color: ColorResources.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 55,
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              markers: _markers,
              onMapCreated: (GoogleMapController controller)async {

                for(int i =0; i<widget.subServiceList.length;i++) {
                  final Uint8List markerIcon = await getBytesFromCanvas(
                      widget.subServiceList[i].servicecentername.length *20, 70, '${widget.subServiceList[i].servicecentername}');
                  setState(() {
                    _markers.add(Marker(
                        onTap: (){
                          _openCameraOptions(context,widget.subServiceList[i]);
                        },
                        markerId: MarkerId('${widget.subServiceList[i].id}'),
                        position: LatLng(double.parse(widget.subServiceList[i].latitude.toString()), double.parse(widget.subServiceList[i].longitude.toString())),
                        icon: BitmapDescriptor.fromBytes(markerIcon)));
                  });
                }
                _controller.complete(controller);
              },
            ),
          ],
        ),
      ),
    );
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 4),
        'assets/images/hotel_place_icon.png');
  }
  Future<Uint8List> getBytesFromCanvas(int width, int height,String price) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = ColorResources.themered;
    final Radius radius = Radius.circular(10.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);

    painter.text = TextSpan(
      text: price,
      style: TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }

  void _openCameraOptions(context, SubService subService) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${subService.servicecentername}',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorResources.lightblack
                        ),),
                        Text('${subService.ownername}',
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorResources.lightblack
                          ),),
                        Text('${subService.email}',
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorResources.lightblack
                          ),),
                        Text('${subService.phone}',
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorResources.lightblack
                          ),),
                        Text('${subService.servicetypeName}',
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorResources.lightblack
                          ),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()=>launch("tel:${subService.phone}"),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.call,
                    color: ColorResources.lightblack,),
                  ),
                ),
              ],
            ),
          );
        });
  }

}
