import 'package:belajarflutter/ui/produk_detail.dart';
import 'package:flutter/material.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _textboxKodeProduk(),
              _textboxNamaProduk(),
              _textboxHargaProduk(),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxKodeProduk() {
    return TextField(
      controller: _kodeProdukController,
      decoration: const InputDecoration(labelText: "Kode Produk"),
    );
  }

  Widget _textboxNamaProduk() {
    return TextField(
      controller: _namaProdukController,
      decoration: const InputDecoration(labelText: "Nama Produk"),
    );
  }

  Widget _textboxHargaProduk() {
    return TextField(
      controller: _hargaProdukController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: "Harga"),
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String kodeProduk = _kodeProdukController.text;
        String namaProduk = _namaProdukController.text;

        // Gunakan int.tryParse agar tidak error saat harga kosong atau bukan angka
        int harga = int.tryParse(_hargaProdukController.text) ?? 0;

        // Berpindah ke halaman ProdukDetail
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              kodeProduk: kodeProduk,
              namaProduk: namaProduk,
              harga: harga,
            ),
          ),
        );
      },
      child: const Text('Simpan'),
    );
  }
}