import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//Navigation destination model
class Destination {
  final String label;
  final Icon icon;
  const Destination(this.label, this.icon);
}

// list of destinations
const List<Destination> destinations = <Destination>[
  Destination('ABOUT ME', Icon(Icons.g_mobiledata_outlined)),
  Destination('EXPERIENCE', Icon(Icons.beenhere_outlined)),
  Destination('EDUCATION', Icon(Icons.school_outlined)),
  Destination('PROJECTS', Icon(Icons.token_outlined)),
  Destination('HOBBIES', Icon(Icons.local_play_outlined)),
  Destination('RESUME', Icon(Icons.file_present_outlined)),
];

class NavRail extends StatelessWidget {
  final int selectedIndex;

  const NavRail({super.key, required this.selectedIndex});
  //open resume
  static Future<void> _launchResumePdf() async {
    final uri = Uri.parse(
      'https://hey-Gana.github.io/gana_website/assets/resume/Ganapathi Subramaniam_Resume.pdf',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    } else {
      debugPrint('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
      fontFamily: 'RobotoMono',
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );

    return Container(
      color: const Color.fromARGB(255, 109, 109, 112),
      child: Column(
        children: [
          Expanded(
            child: NavigationRail(
              selectedIndex: selectedIndex,
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: labelStyle,
              unselectedLabelTextStyle: labelStyle?.copyWith(
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
              destinations:
                  destinations.map((d) {
                    return NavigationRailDestination(
                      icon: d.icon,
                      label: Text(d.label),
                    );
                  }).toList(),
              onDestinationSelected: (int index) {
                switch (index) {
                  case 0:
                    Navigator.pushReplacementNamed(context, '/home');
                    break;
                  case 1:
                    Navigator.pushReplacementNamed(context, '/experience');
                    break;
                  case 2:
                    Navigator.pushReplacementNamed(context, '/education');
                    break;
                  case 3:
                    Navigator.pushReplacementNamed(context, '/projects');
                    break;
                  case 4:
                    Navigator.pushReplacementNamed(context, '/hobbies');
                    break;
                  case 5:
                    _launchResumePdf();
                    break;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<int>(
              icon: const Icon(Icons.webhook_sharp, color: Colors.black),
              onSelected: (value) {
                switch (value) {
                  case 0:
                    launchUrl(
                      Uri.parse(
                        'https://www.linkedin.com/in/ganapathi-subramaniam/',
                      ),
                      mode: LaunchMode.externalApplication,
                    );
                    break;
                  case 1:
                    launchUrl(
                      Uri.parse('https://github.com/hey-Gana'),
                      mode: LaunchMode.externalApplication,
                    );
                    break;
                  case 2:
                    launchUrl(
                      Uri.parse(
                        'https://www.goodreads.com/user/show/52093646-gana',
                      ),
                      mode: LaunchMode.externalApplication,
                    );
                    break;
                  case 3:
                    launchUrl(
                      Uri.parse('https://groovewgana.wordpress.com'),
                      mode: LaunchMode.externalApplication,
                    );
                    break;
                }
              },
              itemBuilder:
                  (context) => const [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        'LinkedIn',
                        style: TextStyle(fontFamily: 'RobotoMono'),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text(
                        'GitHub',
                        style: TextStyle(fontFamily: 'RobotoMono'),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: Text(
                        'Goodreads',
                        style: TextStyle(fontFamily: 'RobotoMono'),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 3,
                      child: Text(
                        'Blog',
                        style: TextStyle(fontFamily: 'RobotoMono'),
                      ),
                    ),
                  ],
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
