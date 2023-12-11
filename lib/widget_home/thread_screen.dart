import 'package:flutter/material.dart';

class ThreadsScreen extends StatelessWidget {
  const ThreadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      flexibleSpace: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          margin: const EdgeInsets.only(top: 60, right: 20),
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
                'Threads',
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
    return Padding(
      padding: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageThreads(),
        ],
      ),
    );
  }
}

class ImageThreads extends StatelessWidget {
  const ImageThreads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Get the app bar height
    double appBarHeight = AppBar().preferredSize.height;

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height - appBarHeight - 70, // Subtract app bar height
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/thread_example.png', // Replace with your actual image path
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Align(
          alignment: Alignment.bottomLeft,
          // Add your child widgets here if needed
          // Example: Text('Your child widget'),
        ),
      ),
    );
  }
}
