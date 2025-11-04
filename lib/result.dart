import 'package:flutter/material.dart';

// 3. Widget Terpisah/Reusable (Stateless)
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  // Getter (properti yang dihitung) untuk menampilkan teks hasil yang berbeda
  String get resultPhrase {
    String resultText;
    if (resultScore <= 15) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 25) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 35) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // 6. UI Dinamis: Gunakan SingleChildScrollView
    //    Ini membuat konten bisa di-scroll jika terjadi overflow
    return SingleChildScrollView(
      // Gunakan 'MediaQuery' untuk mengambil tinggi layar
      // dan 'ConstrainedBox' untuk memastikan Column minimal setinggi layar
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height -
              kToolbarHeight - // Tinggi AppBar
              MediaQuery.of(context).padding.top, // Tinggi Status Bar
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // Pusatkan semua konten secara vertikal dan horizontal
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // 4. Menggunakan Aset Ikon
              Icon(
                Icons.stars_rounded,
                size: 100,
                color: Colors.amber,
              ),
              SizedBox(height: 20),
              // 5. Teks dengan style font kustom
              Text(
                resultPhrase,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  // Font family 'Montserrat' akan diambil dari Theme global
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Your Score: $resultScore',
                style: TextStyle(
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Tombol Restart dengan style baru
              ElevatedButton.icon(
                icon: Icon(Icons.refresh),
                label: Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // Warna teks
                  backgroundColor: Theme.of(context).primaryColor, // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: resetHandler,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

