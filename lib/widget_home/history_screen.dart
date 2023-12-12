import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with AutomaticKeepAliveClientMixin<HistoryScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(
        context); // Penting untuk dipanggil untuk mengaktifkan keep alive

    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: buildBody(context),
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
                'History',
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

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 0),
          // Tambahkan widget Box dengan gambar di dalamnya
          buildImageBox(),
        ],
      ),
    );
  }

  Widget buildImageBox() {
    return Container(
      width: double.infinity, // Lebar box penuh
      height: 170, // Ganti sesuai kebutuhan tinggi box
      decoration: BoxDecoration(
        color: Colors.grey, // Ganti warna sesuai keinginan
        borderRadius: BorderRadius.circular(0),
      ),
      child: Image.asset(
        'assets/images/page_h2.png', // Path dari gambar asset
        fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
      ),
    );
  }
}
