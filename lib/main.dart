import 'package:flutter/material.dart';
import 'classmate.dart';
import 'details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Classmate> listOfClassmates = [
    Classmate(name: "Marta Eggigu", vision: "Software Developer", photoUrl: "images/M.png"),
    Classmate(name: "Bisrat Teshome", vision: "Start Up Company", photoUrl: "images/BS.png"),
    // ... other classmates
  ];

  void _addClassmate(String name, String vision, String photoUrl) {
    setState(() {
      listOfClassmates.add(Classmate(name: name, vision: vision, photoUrl: photoUrl));
    });
  }

  void _removeLastClassmate() {
    setState(() {
      if (listOfClassmates.isNotEmpty) {
        listOfClassmates.removeLast();
      }
    });
  }

  void _navigateToAboutPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Classmate Story App"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("My Classmates"),
                accountEmail: null,
                currentAccountPicture: ClipOval(
                  child: Image.asset("assets/images/Half.png", fit: BoxFit.cover),
                ),
                decoration: const BoxDecoration(color: Colors.green),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text("About"),
                onTap: () => _navigateToAboutPage(context),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listOfClassmates.length,
                itemBuilder: (context, index) {
                  final classmate = listOfClassmates[index];
                  return ListTile(
                    leading: ClipOval(
                      child: Image.asset(
                        "assets/${classmate.photoUrl}",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      classmate.name,
                      style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 113, 74, 184)),
                    ),
                    subtitle: Text(classmate.vision),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(classmate: classmate),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Details(classmate: Classmate(name: "Default Name", vision: "Default Vision", photoUrl: "images/new.png"))),
              ),
              child: const Text("Go to Details "),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _addClassmate("New Classmate", "New Vision", "images/new.png");
                      },
                      child: const Text("Add Classmate"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _removeLastClassmate,
                    child: const Text("Remove Last"),
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

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: const Center(child: Text("About page content")),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: const Center(child: Text("Setting page content")),
    );
  }
}