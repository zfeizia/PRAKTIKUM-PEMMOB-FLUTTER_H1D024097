import 'package:flutter/material.dart';
import 'package:belajarflutter/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var namauser;

  void _saveUsername() async {
    // Inisialisasi Shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Simpan Username ke local storage
    prefs.setString('username', _usernameController.text);
  }

  Widget _showInput(namacontroller, placeholder, isPassword) {
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }

  void _showDialog(pesan, alamat) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pesan),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => alamat,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 4,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, 'Masukkan Username', false),
            const SizedBox(height: 10),
            _showInput(_passwordController, 'Masukkan Password', true),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // Membuat bentuk tombol kotak presisi
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text('Login'),
              onPressed: () {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  // Save Username
                  _saveUsername();
                  // Show alert
                  _showDialog('Anda Berhasil Login', const HomePage());
                } else {
                  // Show alert
                  _showDialog('Username dan Password Salah', const LoginPage());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}