import 'package:flutter/material.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: buildBody(),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      flexibleSpace: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          margin: const EdgeInsets.only(top: 30, right: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xFF979797),
                  fontSize: 11,
                  fontFamily: 'Nunito-Regular',
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Consultation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito-Bold',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WhatDoYouNeed(),
            SizedBox(height: 20),
            ThreeBoxes(),
          ],
        ),
      ),
    );
  }
}

class WhatDoYouNeed extends StatelessWidget {
  const WhatDoYouNeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 410,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(19),
          image: const DecorationImage(
            image: AssetImage(
                'assets/images/x.png'), // Replace with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'What do you need?',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 12 / 16,
                letterSpacing: -0.022,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThreeBoxes extends StatelessWidget {
  const ThreeBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.95,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildBox1(),
            const SizedBox(width: 10),
            buildBox2(),
            const SizedBox(width: 10),
            buildBox3(),
            // Add more boxes as needed
          ],
        ),
      ),
    );
  }
}

Widget buildBox1() {
  return InkWell(
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
                  'assets/images/background_widget.png'), // Ganti dengan path gambar yang sesuai
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 12,
          child: Text(
            'Appointment',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildBox2() {
  return InkWell(
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
                  'assets/images/background_widget.png'), // Ganti dengan path gambar yang sesuai
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 12,
          child: Text(
            'Medicine',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildBox3() {
  return InkWell(
    child: Stack(
      children: [
        Container(
          width: 182,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            border: Border.all(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: 1,
            ),
            image: const DecorationImage(
              image: AssetImage(
                  'assets/images/background_widget.png'), // Ganti dengan path gambar yang sesuai
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 12,
          child: Text(
            'confide',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ],
    ),
  );
}

void main() {
  runApp(const MaterialApp(
    home: ConsultationScreen(),
  ));
}
