import 'dart:math';
import 'package:ease_neura/widget_home/ai_helper.dart';
import 'package:ease_neura/widget_home/consultation_screen.dart';
import 'package:ease_neura/widget_home/maintenance.dart';
import 'package:ease_neura/widget_home/history_screen.dart';
import 'package:ease_neura/widget_home/message_screen.dart';
import 'package:ease_neura/widget_home/profile_screen.dart';
import 'package:ease_neura/widget_home/thread_screen.dart';
import 'package:ease_neura/widget_home/customer_services.dart';
import 'package:ease_neura/widget_home/breathe_assistance_screen.dart';
import 'package:ease_neura/widget_home/mood_tracker_screen.dart';
import 'package:ease_neura/widget_home/volunteer_screen.dart';


import 'package:flutter/material.dart';

abstract class WidgetBase extends StatelessWidget {
  final double? left;
  final double? top;
  final double? width;
  final double? height;

  const WidgetBase({
    this.left,
    this.top,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context);
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 22,
      top: 60,
      width: 50,
      height: 50,
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman Maintenance
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                width: 50,
                height: 50,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/man.png',
                  width: 50,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      top: 70,
      width: 39,
      height: 14,
      child: Text(
        'April 3rd',
        style: TextStyle(
          fontSize: 10,
          color: Colors.black.withOpacity(0.5),
          fontFamily: 'Nunito-Regular',
          letterSpacing: -0.22,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 30,
      top: 85,
      width: 200,
      height: 22,
      child: Text(
        'Welcome, Clay!',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontFamily: 'Nunito-Bold',
          letterSpacing: -0.35,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: 381,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: const Color(0xFF6D6D6D),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 13.0, right: 5.0),
              child: Icon(
                Icons.search,
                size: 24,
                color: Color(0xFF6D6D6D),
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  // Implement your search logic here
                  // You can filter data based on the entered value
                  // For example, if you have a list of items, you can filter them like this:
                  // filteredItems = originalItems.where((item) => item.contains(value)).toList();
                },
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF6D6D6D),
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

class Consultation extends StatelessWidget {
  const Consultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman ConsultationScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ConsultationScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 182,
            height: 222,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/background_widget.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            left: 17,
            top: 185,
            child: Text(
              'Consultation',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Threads extends StatelessWidget {
  final double right;

  const Threads({Key? key, required this.right}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: 0,
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman Maintenance
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ThreadsScreen(),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              width: 182,
              height: 222,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/background_widget.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              right: 17,
              top: 185,
              child: Text(
                'Threads',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentHeartBeat extends StatelessWidget {
  const CurrentHeartBeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: InkWell(
        child: Stack(
          children: [
            Container(
              width: 229.2,
              height: 116.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.97),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/heartbeat.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AiHelper extends StatelessWidget {
  final double right;

  const AiHelper({Key? key, required this.right}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: 0,
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman Maintenance
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AIHelperr(),
            ),
          );
        },
        child: Container(
          width: 143.05,
          height: 115.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.92),
            border: Border.all(
              color: Colors.black,
              width: 0.522278,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/background_widget.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'AI Helper',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 14.1463,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewArtikel extends StatelessWidget {
  const NewArtikel({Key? key, Key? home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman Maintenance
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Maintenance(),
            ),
          );
        },
        child: Stack(
          children: [
            // Positioned to place the text "New Articles!" above the container
            const Positioned(
              left: 4,
              top: 13,
              child: SizedBox(
                child: Text(
                  'New Articles!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // New Container below "New Articles!"
            Container(
              margin:
                  const EdgeInsets.only(top: 40), // Adjust the margin as needed
              width: max(500, 500),
              height: 194,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  filterQuality: FilterQuality.low,
                  image: AssetImage(
                    'assets/images/news.png', // Update with the correct path
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Volunteer extends StatelessWidget {
  const Volunteer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman Maintenance
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Volunteers(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 182,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/background_widget.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            left: 17,
            top: 170,
            child: Text(
              'Volunteer',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoodTracker extends StatelessWidget {
  final double right;

  const MoodTracker({Key? key, required this.right}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: 0,
      bottom: 0,
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman Maintenance
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MoodTrackers(),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              width: 182,
              height: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/background_widget.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              right: 17,
              top: 170,
              child: Text(
                'Mood Tracker',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BreatheAssistant extends StatelessWidget {
  const BreatheAssistant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman Maintenance
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BreatheAssistance(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 182,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/background_widget.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            left: 17,
            top: 170,
            child: Text(
              'Breathe Assistant',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerService extends StatelessWidget {
  final double right;

  const CustomerService({Key? key, required this.right}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: 0,
      bottom: 0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CustServ(),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              width: 182,
              height: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/background_widget.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              right: 17,
              top: 170,
              child: Text(
                'Customer Service',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstView extends StatelessWidget {
  const FirstView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background color here
      child: Stack(
        children: [
          Profile(),
          Calendar(),
          Welcome(),
        ],
      ),
    );
  }
}

class MiddleView extends StatelessWidget {
  const MiddleView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background color here
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 0,
              ),
              SearchBar(),

              // space between search bar to the next content
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Consultation(),
                  Threads(right: 0),
                ],
              ),
              // space between consultation and threads to the next content
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  CurrentHeartBeat(),
                  AiHelper(right: 0),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              NewArtikel(),
              // space between current heartbeat and ai helper to the next content
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Volunteer(),
                  MoodTracker(right: 0),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  BreatheAssistant(),
                  CustomerService(right: 0),
                ],
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    FirstView(),
    HistoryScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the scaffold
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            top: 115,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: MiddleView(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 135,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, 'Home', Icons.home),
              _buildNavItem(1, 'History', Icons.history),
              _buildNavItem(2, 'Message', Icons.message),
              _buildNavItem(3, 'Profile', Icons.person),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData iconData) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });

        // Navigate to the corresponding page
        switch (index) {
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryScreen()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessageScreen()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
            break;
        }
      },
      child: Column(
        children: [
          Icon(
            iconData,
            size: 24,
            color: _selectedIndex == index ? Colors.white : Colors.grey,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 9.20952,
              color: _selectedIndex == index ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
