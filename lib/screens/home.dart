import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:flutter_map/flutter_map.dart';

// Define a Home class that extends StatelessWidget
class Home extends StatelessWidget {
  // Constructor for Home, taking an optional Key parameter
  const Home({Key? key}) : super(key: key);

  // Override the build method to describe how to display this widget
  @override
  Widget build(BuildContext context) {
    // Return a MaterialApp with its home property set to an instance of MyScaffold
    return MaterialApp(
      home: MyScaffold(
        // Set the drawer of MyScaffold to be the drawer variable defined earlier
        drawer: drawer,
        // Set the body of MyScaffold to be a Stack containing one child
        body: Stack(
          children: [
            // The child is a FlutterMap with specific options and children
            FlutterMap(
              options: MapOptions(
                // Set properties of the MapOptions, including minZoom, maxZoom, zoom, and center
                minZoom: 5,
                maxZoom: 18,
                zoom: 10,
                center: AppConstants.myLocation,
              ),
              children: [
                // The first child is a TileLayer with a specific urlTemplate
                TileLayer(urlTemplate: "?access_token="), // add your token here
                // The second child is a SearchBar with specific hintText
                const SearchBar(hintText: 'rechercher...'),
                // The third child is a GestureDetector with an onTap callback that navigates to the Home screen
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Home();
                        },
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
