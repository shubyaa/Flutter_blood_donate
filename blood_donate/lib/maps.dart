import 'package:blood_donate/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

final lat = 19.0790;
final lng = 72.8777;

final cordinates = LatLng(lat, lng);
final center = LatLng(lat - 0.003, lng);
final _controller = SwipeableCardSectionController();

class MapsPage extends StatelessWidget {
  MapsPage({Key? key}) : super(key: key);

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
                  )
                ],
              )
            ],
          ),
          // LineCharts(),

          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: SwipeableCardsSection(
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
          )
        ],
      ),
    );
  }
}
