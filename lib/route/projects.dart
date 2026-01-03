import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
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
            const NavRail(selectedIndex: 3),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "PROJECTS",
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ...projects.map((project) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 32.0),
                          child: glassyContainer(
                            child: projectSection(context, project),
                          ),
                        );
                      }),
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
                color: const Color.fromARGB(255, 0, 0, 0).withAlpha(76),
                borderRadius: BorderRadius.circular(16),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget projectSection(BuildContext context, Project project) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 850;

        final textContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: const TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ...project.descriptions.map(
              (desc) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  desc,
                  style: const TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                final uri = Uri.parse(project.url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {}
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Link",
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );

        final imageContent = Image.asset(
          project.imagePath,
          height: 250,
          fit: BoxFit.contain,
          errorBuilder:
              (context, error, stackTrace) => Text(
                project.title,
                style: const TextStyle(
                  fontFamily: 'RobotoMono',
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
        );

        return isWide
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: textContent),
                const SizedBox(width: 40),
                Expanded(flex: 1, child: imageContent),
              ],
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textContent,
                const SizedBox(height: 20),
                Center(child: imageContent),
              ],
            );
      },
    );
  }
}

//project list
final List<Project> projects = [
  Project(
    title: "Split-A-Bill",
    descriptions: [
      '1. Built an AI-powered receipt ingestion pipeline using Google Cloud Vision OCR, extracting structured pricing and tax data from unstructured bills, reducing manual entry by ~90%.',
      '2. Implemented RESTful microservices with Java and Spring Boot for bill management and user workflows, enabling scalable CRUD operations for concurrent users.',
      '3. Formulated proportional split and tip-calculation algorithms with modular business logic to enable extensibility and maintainability.',
      '4. Hosted backend services on Google Cloud Platform (Cloud Run) with monitoring and logging, achieving ~99% service availability and actionable performance insights.',
    ],
    imagePath: 'images/Splitabill.png',
    url: 'https://hey-gana.github.io/splitable/',
  ),
  Project(
    title: "TacTics - Competitive twists to classical Tic-Tac-Toe",
    descriptions: [
      '1. Implemented an AI opponent using the Minimax adversarial search algorithm, delivering optimal single-player gameplay across multiple game variants.',
      '2. Developed a cross-platform Flutter application with responsive UI and efficient state management, supporting smooth gameplay on iOS and Android.',
    ],
    imagePath: 'images/TacTics_homepage.png',
    url: 'https://github.com/hey-Gana/TacTics',
  ),
  Project(
    title: "AutoApplyLn",
    descriptions: [
      '1. Orchestrated an end-to-end system to discover, filter, and process LinkedIn job postings, automating application workflows and reducing manual application effort by ~80%.',
      '2. Extracted structured job data with Selenium-based scraping modules, enabling tracking of 100+ applications concurrently and generating actionable reports that improved user outreach visibility by ~70%.',
    ],
    imagePath: 'images/autoApplyLn.png',
    url: 'https://github.com/hey-Gana/autoApplyLn',
  ),
];
