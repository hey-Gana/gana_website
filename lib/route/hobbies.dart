import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/hobbies_model.dart';
import '../widgets/navbar.dart';

class Hobbies extends StatefulWidget {
  const Hobbies({super.key});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

//Music
class _HobbiesState extends State<Hobbies> {
  final List<Music> musicList = [
    Music(
      imagePath: 'images/yt1.jpg',
      youtubeUrl: 'https://youtu.be/erxkUQD3vhE?si=imq-k-l0Twer2Idu',
    ),
    Music(
      imagePath: 'images/yt2.jpg',
      youtubeUrl: 'https://youtu.be/0-BIHAoBNa0?si=rS948DXFNGdvE4YW',
    ),
  ];
  //Photography Section
  // final List<Photos> photoList = [
  //   Photos(imagePath: 'images/bridge.JPG', caption: 'Bridge to Somewhere'),
  //   Photos(imagePath: 'images/camo.JPG', caption: 'Camouflaged Beauty'),
  //   Photos(
  //     imagePath: 'images/carpet_of_clouds.JPG',
  //     caption: 'Carpet of Clouds',
  //   ),
  //   Photos(
  //     imagePath: 'images/cottonCandyClouds.JPG',
  //     caption: 'Cotton Candy Clouds',
  //   ),
  //   Photos(imagePath: 'images/cracked_hope.JPG', caption: 'Cracked Hope'),
  //   Photos(imagePath: 'images/ducks.JPG', caption: 'Ripple Effect'),
  //   Photos(imagePath: 'images/for_peace.JPG', caption: 'Peace through Safety!'),
  //   Photos(
  //     imagePath: 'images/freedom_slavery.JPG',
  //     caption: 'Freedom is Slavery.',
  //   ),
  //   Photos(imagePath: 'images/lost_pride.JPG', caption: 'Lost Pride'),
  //   Photos(imagePath: 'images/peace.JPG', caption: 'Moments of Peace'),
  //   Photos(imagePath: 'images/setSail.JPG', caption: 'Ready to set sail!'),
  //   Photos(
  //     imagePath: 'images/stairwaysToHeaven.JPG',
  //     caption: 'Stairways to Heaven',
  //   ),
  // ];

  //Book Reviews
  final List<Book> bookList = [
    Book(
      title: 'Connect with me on Goodreads!',
      review:
          'Explore my book reviews, and if something resonates with you, feel free to share your thoughts.',
      goodreadsUrl:
          'https://www.goodreads.com/review/list/52093646-gana?shelf=read&view=covers',
    ),
  ];

  final PageController _musicController = PageController(viewportFraction: 0.8);
  final PageController _photoController = PageController(viewportFraction: 0.8);
  final List<bool> _isExpanded = [false, false, false];
  final int _selectedIndex = 4;

  @override
  void dispose() {
    _musicController.dispose();
    _photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const sectionTitleTextStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 18,
      color: Colors.white,
    );

    const bodyTextStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 14,
      color: Colors.white70,
    );

    const expandedTitleTextStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: Colors.black,
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
            NavRail(selectedIndex: _selectedIndex),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text("HOBBIES", style: titleTextStyle),
                        ),
                        const SizedBox(height: 32),

                        glassyContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const [
                              Text(
                                "Say hi to my fun side:",
                                style: sectionTitleTextStyle,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "I believe in constantly learning and growing, which is why I take up a new hobby every year. This tradition began during the COVID-19 pandemic and has since become a cherished part of my life. Each year brings a new challenge and a fresh perspective, keeping my creative spirit alive.",
                                style: bodyTextStyle,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        glassyContainer(
                          child: _buildExpandableCard(
                            index: 0,
                            title: 'My Love for Music:',
                            description:
                                'Music has been a big part of my life since childhood. Having completed 7 grades and earned certification from the London College of Music (LCM) in electronic keyboard, I’ve developed a deep appreciation for the intricacies of music and the ability to replicate them. I often transpose this knowledge to other instruments like the Kalimba, Guitar, Violin, and Flute. I believe music is the language of nature, and I consider myself an ambassador of it.',
                            expandedContent: _buildCarousel(
                              controller: _musicController,
                              items:
                                  musicList.map((music) {
                                    return GestureDetector(
                                      onTap:
                                          () => launchUrl(
                                            Uri.parse(music.youtubeUrl),
                                          ),
                                      child: _buildImageCard(music.imagePath),
                                    );
                                  }).toList(),
                              onBack: () => _previousPage(_musicController),
                              onForward: () => _nextPage(_musicController),
                            ),
                            expandedTitleTextStyle: expandedTitleTextStyle,
                            descriptionTextStyle: bodyTextStyle,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // glassyContainer(
                        //   child: _buildExpandableCard(
                        //     index: 1,
                        //     title: 'Timeless Photography',
                        //     description: 'After watching a movie during COVID, I realized how beautiful photography is—it has the power to freeze time. Every time we look back at pictures, they often evoke a sense of nostalgia. Still photography can be interpreted in many ways, and I want to make my own attempt at capturing and sharing my perspective. Who knew shadows and depth could reveal so much beauty?',
                        //     expandedContent: _buildCarousel(
                        //       controller: _photoController,
                        //       items:
                        //           photoList.map((photo) {
                        //             return Column(
                        //               children: [
                        //                 _buildImageCard(photo.imagePath),
                        //                 const SizedBox(height: 8),
                        //                 Text(
                        //                   photo.caption,
                        //                   style: bodyTextStyle.copyWith(
                        //                     fontStyle: FontStyle.italic,
                        //                     fontSize: 14,
                        //                   ),
                        //                   textAlign: TextAlign.center,
                        //                 ),
                        //               ],
                        //             );
                        //           }).toList(),
                        //       onBack: () => _previousPage(_photoController),
                        //       onForward: () => _nextPage(_photoController),
                        //     ),
                        //     expandedTitleTextStyle: expandedTitleTextStyle,
                        //     descriptionTextStyle: bodyTextStyle,
                        //   ),
                        // ),
                        // const SizedBox(height: 24),
                        glassyContainer(
                          child: _buildExpandableCard(
                            index: 2,
                            title: 'Book Reviews',
                            description:
                                'I once came across a quote that said, "Reading without reflecting is like eating without digesting." That line changed the way I approach books. Now, for every book I read, I make it a point to write a detailed review or summary—capturing what I liked, what I understood, and sharing my personal reflections. I believe that while words may never fully capture the depth of emotions and feelings, that shouldn’t stop us from trying. This habit has inspired me to write poems and verses in both Tamil and English, and has even sparked meaningful conversations with strangers.',
                            expandedContent: Column(
                              children:
                                  bookList.map((book) {
                                    return ListTile(
                                      title: Text(
                                        book.title,
                                        style: const TextStyle(
                                          fontFamily: 'RobotoMono',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        book.review,
                                        style: const TextStyle(
                                          fontFamily: 'RobotoMono',
                                          color: Colors.white70,
                                        ),
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(
                                          Icons.open_in_new,
                                          color: Colors.white,
                                        ),
                                        onPressed:
                                            () => launchUrl(
                                              Uri.parse(book.goodreadsUrl),
                                            ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                            expandedTitleTextStyle: expandedTitleTextStyle,
                            descriptionTextStyle: bodyTextStyle,
                          ),
                        ),
                      ],
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

  Widget glassyContainer({required Widget child}) {
    return ClipRRect(
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
    );
  }

  void _previousPage(PageController controller) {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextPage(PageController controller) {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildExpandableCard({
    required int index,
    required String title,
    required String description,
    required Widget expandedContent,
    required TextStyle expandedTitleTextStyle,
    required TextStyle descriptionTextStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap:
                () => setState(() => _isExpanded[index] = !_isExpanded[index]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(title, style: expandedTitleTextStyle)),
                Icon(
                  _isExpanded[index] ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(description, style: descriptionTextStyle),
          if (_isExpanded[index]) ...[
            const SizedBox(height: 16),
            expandedContent,
          ],
        ],
      ),
    );
  }

  Widget _buildCarousel({
    required PageController controller,
    required List<Widget> items,
    required VoidCallback onBack,
    required VoidCallback onForward,
  }) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: items.length,
            itemBuilder: (context, index) => items[index],
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white70),
                onPressed: onBack,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white70,
                ),
                onPressed: onForward,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String path) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.contain, // Ensures image is fully visible
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
    );
  }
}
