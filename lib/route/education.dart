import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    const headingStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const titleStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const bold16Style = TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    );

    const regular16Style = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 16,
      color: Colors.white70,
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0009BD), Color(0xFF000000)],
          ),
        ),
        child: Row(
          children: [
            const NavRail(selectedIndex: 2),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const Center(
                        child: Text("EDUCATION", style: headingStyle),
                      ),
                      const SizedBox(height: 32),

                      // IIT Section
                      glassyContainer(
                        child: educationSection(
                          imagePath: 'images/iit.png',
                          title: "ILLINOIS INSTITUTE OF TECHNOLOGY",
                          degree:
                              "Master's in Applied Science – Computer Science (Specialization: Software Engineering)",
                          coursework:
                              "Software Engineering, Software Project Management, Software System Architecture, "
                              "Database Organization, Big Data Technologies, Data Processing & Analysis, "
                              "Mobile Application Development, Software Testing & Analysis",
                          organizations:
                              "Startup Studio Club, SEDS - Students for the Exploration & Development of Space",
                          titleStyle: titleStyle,
                          degreeStyle: regular16Style,
                          boldTextStyle: bold16Style,
                        ),
                      ),
                      const SizedBox(height: 32),

                      //SASTRA Section
                      glassyContainer(
                        child: educationSection(
                          imagePath: 'images/sastra.png',
                          title: "SASTRA UNIVERSITY",
                          degree:
                              "Bachelors in Technology - Mechanical Engineering",
                          coursework:
                              "Software Engineering, Web Application Development using Java, Web Technology, "
                              "Management Information Systems, Operation Research",
                          organizations:
                              "Entrepreneurship Club (E-Cell Sastra), Sakshama - Mechanical Engineering Club",
                          titleStyle: titleStyle,
                          degreeStyle: regular16Style,
                          boldTextStyle: bold16Style,
                        ),
                      ),

                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget glassyContainer({required Widget child}) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(76), // fixed opacity
                borderRadius: BorderRadius.circular(16),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget educationSection({
    required String imagePath,
    required String title,
    required String degree,
    required String coursework,
    required String organizations,
    required TextStyle titleStyle,
    required TextStyle degreeStyle,
    required TextStyle boldTextStyle,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 850;
        final imageWidget = Image.asset(
          imagePath,
          height: 250,
          fit: BoxFit.contain,
          color: Colors.white,
          errorBuilder:
              (context, error, stackTrace) => Text(
                title,
                style: const TextStyle(
                  fontFamily: 'RobotoMono',
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
        );

        final content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(degree, style: degreeStyle),
            const SizedBox(height: 20),
            Text("Coursework", style: boldTextStyle),
            const SizedBox(height: 8),
            Text(coursework, style: degreeStyle),
            const SizedBox(height: 20),
            Text("Student Organizations", style: boldTextStyle),
            const SizedBox(height: 8),
            Text(organizations, style: degreeStyle),
          ],
        );

        return isWide
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: content),
                const SizedBox(width: 40),
                Expanded(flex: 1, child: imageWidget),
              ],
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                content,
                const SizedBox(height: 20),
                Center(child: imageWidget),
              ],
            );
      },
    );
  }
}
