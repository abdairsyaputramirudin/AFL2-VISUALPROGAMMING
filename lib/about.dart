import 'package:flutter/material.dart';
import 'gallery.dart';
import 'profile.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Portfolio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 10,
        actions: <Widget>[
          _buildHoverButton('Profile', 0, context),
          _buildHoverButton('About', 1, context),
          _buildHoverButton('Gallery', 2, context),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/gallery/gallery0.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'About Me',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'I am a creative and passionate individual who thrives in the fields of design, coding, and technology. I enjoy solving complex problems and delivering innovative solutions that make an impact.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Activity',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 5,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.code),
                      title: Text('Programming'),
                    ),
                    ListTile(
                      leading: Icon(Icons.design_services),
                      title: Text('Design'),
                    ),
                    ListTile(
                      leading: Icon(Icons.lightbulb),
                      title: Text('Problem Solving'),
                    ),
                    ListTile(
                      leading: Icon(Icons.create),
                      title: Text('Creative'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHoverButton(String title, int index, BuildContext context) {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                } else if (index == 1) {
                  // Tetap di About
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GalleryScreen()),
                  );
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: isHovered
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Colors.transparent,
                foregroundColor: isHovered ? Colors.black : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
