// import 'package:flutter/material.dart';
// import 'package:sentryhome/components/my_drawer.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "H O M E",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         // center this text
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Theme.of(context).colorScheme.inversePrimary,
//         elevation: 0,
//       ),
//       drawer: const MyDrawer(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:sentryhome/components/my_drawer.dart';
import 'package:sentryhome/pages/qr_scanner_page.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for the cameras
    final List<Map<String, String>> cameras = [
      {"name": "Front Door", "location": "Entrance", "status": "Active"},
      {"name": "Backyard", "location": "Garden", "status": "Inactive"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "H O M E",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRScannerPage()),
              );
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: cameras.length,
        itemBuilder: (context, index) {
          final camera = cameras[index];
          return ListTile(
            title: Text(camera['name']!),
            subtitle: Text('Location: ${camera['location']}'),
            trailing: Text(
              camera['status']!,
              style: TextStyle(
                color: camera['status'] == 'Active' ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
