import 'package:flutter/material.dart';
import 'package:flutter_proxigo_v1/constants/constants.dart';
import '../widgets/widgets.dart';

// Define a Profile class that extends StatelessWidget
class Profile extends StatelessWidget {
  // Constructor for Profile, taking an optional Key parameter
  const Profile({Key? key}) : super(key: key);

  // Override the build method to describe how to display this widget
  @override
  Widget build(BuildContext context) {
    // Return an instance of MyScaffold with specific drawer and body properties
    return MyScaffold(
      drawer: drawer,
      body: Padding(
        // Add padding around the body using EdgeInsets.all
        padding: const EdgeInsets.all(8.0),
        // The child of the Padding is a Column with several children widgets
        child: Column(
          children: [
            // The first child is a Row with two children widgets
            Row(
              children: [
                // The first child is an Expanded widget with flex 1 containing a Container with an Image asset
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Image.asset('assets/profil.jpeg'),
                  ),
                ),
                // The second child is a Padding widget with specific padding containing an Expanded widget with flex 1 and several children widgets
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // The first child is a Text widget with specific style for the name
                        const Text(
                          'My Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        // The second child is a SizedBox with fixed height for spacing
                        const SizedBox(height: 15),
                        // The third child is an ElevatedButton for going to profile detail
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(proxigoBlue),
                            minimumSize:
                                MaterialStateProperty.all(const Size(180, 110)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Add your navigation logic here
                          },
                          child: const Text(
                            'MON PROFIL',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // The second child is an Expanded widget containing a ListView with several children widgets
            Expanded(
              child: ListView(
                children: const <Widget>[
                  // Each child is a ListTile with specific leading and title properties
                  ListTile(
                    leading: flecheProfil,
                    title: Text('Réserver une commande', style: texteProfil),
                  ),
                  ListTile(
                    leading: flecheProfil,
                    title: Text('Commandes actuelles', style: texteProfil),
                  ),
                  ListTile(
                    leading: flecheProfil,
                    title: Text('Cashback', style: texteProfil),
                  ),
                  ListTile(
                    leading: flecheProfil,
                    title: Text('Avis', style: texteProfil),
                  ),
                  ListTile(
                    leading: flecheProfil,
                    title: Text('Commandes passées', style: texteProfil),
                  ),
                  ListTile(
                    leading: flecheProfil,
                    title: Text('Souscrire Abonnement', style: texteProfil),
                  ),
                  ListTile(
                    leading: flecheProfil,
                    title: Text('Détails du compte', style: texteProfil),
                  ),
                  ListTile(
                    leading: flecheProfil,
                    title: Text(
                      'Supprimer son compte',
                      style: texteProfil,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
