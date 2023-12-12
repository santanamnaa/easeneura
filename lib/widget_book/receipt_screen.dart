import 'package:ease_neura/widget_book/booking_screen.dart';

import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  final DataWaktu dataWaktu;

  ReceiptScreen({required this.dataWaktu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'), // Ubah judul sesuai kebutuhan
      ),
      body: Container(
        color: Colors.white, // Set warna latar belakang
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Receipt Details',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Tambahkan widget atau informasi lainnya sesuai kebutuhan
            Text('Appointment Time: ${dataWaktu.selectedTime}'),
            Text('Price: Rp 100,000'), // Ganti dengan harga yang sesuai
            // Tambahkan informasi lainnya
          ],
        ),
      ),
    );
  }
}
