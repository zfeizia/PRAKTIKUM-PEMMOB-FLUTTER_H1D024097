class Queue {
  // Properti untuk menyimpan daftar elemen antrean
  List<dynamic> _elements = [];

  /// Metode untuk menambahkan elemen ke dalam antrean
  void enqueue(dynamic element) {
    _elements.add(element);
    print('Menambahkan "$element" ke dalam antrean.');
  }

  /// Metode untuk menghapus dan mengembalikan elemen pertama dari antrean
  dynamic pop() {
    if (isEmpty()) {
      print('Antrean kosong! Tidak ada elemen yang dapat diambil.');
      return null;
    }
    // Menghapus elemen pertama (indeks 0)
    return _elements.removeAt(0);
  }

  /// Metode pendukung untuk memeriksa apakah antrean kosong
  bool isEmpty() {
    return _elements.isEmpty;
  }

  /// Metode untuk menampilkan seluruh isi antrean
  void tampilkanAntrian() {
    print('Isi antrean saat ini: $_elements');
  }
}

void main() {
  // Membuat objek dari class Queue
  Queue antrian = Queue();

  // Menggunakan metode enqueue
  antrian.enqueue("Jambu");
  antrian.enqueue("Mangga");
  antrian.enqueue("Jeruk");

  print('');
  antrian.tampilkanAntrian();
  print('');

  // Menggunakan metode pop
  var diproses1 = antrian.pop();
  print('Memproses elemen: $diproses1'); // Menghapus 'Jambu'

  var diproses2 = antrian.pop();
  print('Memproses elemen: $diproses2'); // Menghapus 'Mangga'

  print('');
  antrian.tampilkanAntrian();
}