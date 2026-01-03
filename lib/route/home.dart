import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gwg_website/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            const NavRail(selectedIndex: 0),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        // 👇 Fixed: Replaced deprecated .withOpacity()
                        color: const Color.fromARGB(255, 0, 0, 0).withAlpha(76),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Center(
                                  child: Text(
                                    "ABOUT ME",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'RobotoMono',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    final textStyle = const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'RobotoMono',
                                    );

                                    if (constraints.maxWidth > 850) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Hello, I’m S.Ganapathi Subramaniam (Gana)!",
                                                  style: textStyle.copyWith(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "I’m a technology enthusiast with a passion for understanding how businesses work and thrive.",
                                                  style: textStyle,
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "Driven by curiosity and adaptability, I specialize in bridging the gap between innovation and business needs. My mission is simple yet impactful: bringing the 'awe' in Automation & Quality in everything I do.",
                                                  style: textStyle,
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "My motto: LISTEN | LEARN | LEAD",
                                                  style: textStyle.copyWith(
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 40),
                                          Expanded(
                                            flex: 1,
                                            child: Image.asset(
                                              'images/GS_HS.png',
                                              fit: BoxFit.contain,
                                              height: 250,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => const Text(
                                                    'Ganapathi Subramaniam',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'RobotoMono',
                                                    ),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Hello, I’m S.Ganapathi Subramaniam (Gana)!",
                                                style: textStyle.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                "I’m a technology enthusiast with a passion for understanding how businesses work and thrive.",
                                                style: textStyle,
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                "Driven by curiosity and adaptability, I specialize in bridging the gap between innovation and business needs. My mission is simple yet impactful: bringing awe in Automation & Quality in everything I do.",
                                                style: textStyle,
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                "My motto: LISTEN | LEARN | LEAD",
                                                style: textStyle.copyWith(
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Image.asset(
                                            'images/GS_HS.png',
                                            fit: BoxFit.contain,
                                            height: 250,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Text(
                                                      'Ganapathi Subramaniam',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'RobotoMono',
                                                      ),
                                                    ),
                                          ),
                                        ],
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
