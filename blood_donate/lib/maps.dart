import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_functions.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

final lat = 19.0790;
final lng = 72.8777;

late UserLocation location;
final cordinates = LatLng(lat, lng);
final center = LatLng(lat - 0.003, lng);
var _controller = SwipeableCardSectionController();

class MapsPage extends StatefulWidget {
  MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  LocationData? _current;

  @override
  void initState() {
    () async {
      location = await getLocation();
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterMap(
            options: MapOptions(
              center: center,
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
                    point: _current == null
                        ? center
                        : LatLng(location.latitude!, location.longitude!),
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
