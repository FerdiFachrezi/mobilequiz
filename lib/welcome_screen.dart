import 'package:flutter/material.dart';
import './quiz_screen.dart'; // Import halaman kuis

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Controller untuk mengambil teks dari input field
  final _nameController = TextEditingController();
  String _errorMessage = ''; // Untuk menampilkan pesan error jika nama kosong

  // Fungsi untuk memvalidasi dan pindah halaman
  void _startQuiz() {
    if (_nameController.text.isEmpty) {
      // Tampilkan pesan error jika nama kosong
      setState(() {
        _errorMessage = 'Nama tidak boleh kosong!';
      });
    } else {
      // Hapus pesan error
      setState(() {
        _errorMessage = '';
      });

      // Pindah ke QuizScreen dan kirim nama pengguna
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(
            userName: _nameController.text,
          ),
        ),
      );
    }
  }

  // PENTING: Selalu dispose controller saat widget tidak lagi digunakan
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Gunakan SingleChildScrollView agar tidak overflow saat keyboard muncul
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // Tambahkan padding agar tidak terlalu mepet ke tepi layar
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          // Set tinggi agar minimal setinggi layar
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Pusatkan konten
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. LOGO BUKU (Icons.menu_book) - Sesuai permintaan
              Icon(
                Icons.menu_book, // Mengganti ikon lama
                size: 140,
                color: Colors.indigo,
              ),
              SizedBox(height: 30),
              Text(
                'Selamat Datang di Kuis!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Silakan masukkan nama Anda untuk memulai',
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Input field untuk nama
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Anda',
                  hintText: 'Masukkan nama...',
                  // Tampilkan pesan error jika _errorMessage tidak kosong
                  errorText: _errorMessage.isEmpty ? null : _errorMessage,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: 30),

              // Tombol untuk memulai kuis
              ElevatedButton(
                onPressed: _startQuiz, // Panggil fungsi _startQuiz
                child: Text('Mulai Kuis'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}