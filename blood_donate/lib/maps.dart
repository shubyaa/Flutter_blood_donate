import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_functions.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

final lat = 19.0790;
final lng = 72.8777;

final cordinates = LatLng(lat, lng);
final center = LatLng(lat - 0.003, lng);
var _controller = SwipeableCardSectionController();

var status = Geolocator.checkPermission();

class MapsPage extends StatefulWidget {
  MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  void initState() {
    super.initState();
  }

  Position? _position;
  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _position = position;
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterMap(
            options: MapOptions(
              center: _position != null
                  ? LatLng(_position!.latitude, _position!.longitude)
                  : center,
              zoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/shubyaa/cl8wv825z000214qk0gcbizgh/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2h1YnlhYSIsImEiOiJjbDh3djZwYTIwMGhqM3VvOXhvZTBpb2gwIn0.DwwCSKME3wbRnYLYUEpNwA',
                additionalOptions: const {
                  'accessToken':
                      'pk.eyJ1Ijoic2h1YnlhYSIsImEiOiJjbDh3djZwYTIwMGhqM3VvOXhvZTBpb2gwIn0.DwwCSKME3wbRnYLYUEpNwA',
                  'id': 'mapbox.mapbox-streets-v8',
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: cordinates,
                    builder: (context) {
                      return const Icon(
                        Icons.location_on_sharp,
                        size: 50,
                        color: Colors.red,
                      );
                    },
                  ),
                  Marker(
                    // point: cordinates,
                    point: _position != null
                        ? LatLng(_position!.latitude, _position!.longitude)
                        : center,
                    builder: (context) {
                      return Icon(
                        Icons.location_on_sharp,
                        size: 50,
                        color: darkGreen,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: midGreen,
                  onPressed: () {},
                  child: Icon(
                    Icons.my_location,
                    color: darkGreen,
                  ),
                ),
                SwipeableCardsSection(
                  cardController: _controller,
                  enableSwipeDown: false,
                  enableSwipeUp: false,
                  context: context,
                  items: [
                    mapsCard(context, _controller),
                    mapsCard(context, _controller),
                    mapsCard(context, _controller),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
