import 'package:flutter/material.dart';
import 'story.dart';
import 'messenger.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color.fromARGB(255, 45, 148, 233), Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'facebook',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Messenger(),
                ),
              );
            },
            icon:
                const FaIcon(FontAwesomeIcons.facebookMessenger, color: Colors.blue),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          // Top navigation bar
          SizedBox(
            height: 50,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, color: Colors.blue, size: 30),
                Icon(Icons.group, color: Colors.grey, size: 30),
                Icon(Icons.person, color: Colors.grey, size: 30),
                Icon(Icons.live_tv, color: Colors.grey, size: 30),
                Stack(
                  children: [
                    Icon(Icons.notifications, color: Colors.grey, size: 30),
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 6,
                        child: Text(
                          '3',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.menu, color: Colors.grey, size: 30),
              ],
            ),
          ),

          // Post input field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png'),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What's on your mind, Sanjay?",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 204, 204, 204)),
                      suffixIcon: const Icon(Icons.image_rounded, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: const Icon(Icons.search, color: Colors.black),
                ),
              ],
            ),
          ),

          // Options like Reels, Room, Group, Live
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconButton(Icons.movie, "Reels", Colors.orange),
                _buildIconButton(Icons.video_call, "Room", Colors.purple),
                _buildIconButton(Icons.group, "Group", Colors.blue),
                _buildIconButton(Icons.live_tv, "Live", Colors.red),
              ],
            ),
          ),

          // Story section
          SizedBox(
            height: 270,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStory(
                    context, 'assets/images/img0.png', "Add New", '', '', ''),
                _buildStory(context, 'assets/images/img1.png', "Vish Patil",
                    '4h', 'Neha Kakkar', 'assets/images/p1.png'),
                _buildStory(context, 'assets/images/img2.png', "Rakesh Shetty",
                    '4h', 'Neha Kakkar', 'assets/images/p2.png'),
                _buildStory(context, 'assets/images/img3.png', "Akash Bolre",
                    '4h', 'Neha Kakkar', 'assets/images/p3.png'),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          // Post Section
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildPost(
                  "Deven mestry is with Mahesh Joshi.",
                  "Old is Gold..!! ❤️🔥",
                  "assets/images/img5.png",
                  "Liked by Sachin Ramble and 100 others",
                  "4 comments",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildStory(BuildContext context, String image, String name,
      String time, String music, String avatar) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center-align content
        children: [
          Stack(
            clipBehavior:
                Clip.none, // Allow avatar to overflow the image boundaries
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                  onTap: () {
                    if (name != 'Add New') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryShow(
                            image: image,
                            userName: name,
                            time: time,
                            music: music,
                            avatar: avatar,
                          ),
                        ),
                      );
                    }
                  },
                  child: Image.asset(
                    image,
                    width: 115,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (avatar.isNotEmpty && name != 'Add New')
                Positioned(
                  bottom: -25, // Moves the avatar below the image
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                      radius: 25,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              if (name == 'Add New')
                Positioned(
                  bottom:
                      -25, // Place the "Add" icon in the center below the image
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Image.asset(
                        "assets/images/add.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 30), // Space for the avatar or "Add New"
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPost(String userDetails, String content, String image,
      String likes, String comments) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/img4.png'),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userDetails,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "1h · Mumbai, Maharashtra",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: 10),
          Text(content),
          const SizedBox(height: 10),
          Image.asset(image),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                likes,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                comments,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
