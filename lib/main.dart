import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: shellSort(),
    );
  }
}

class shellSort extends StatefulWidget {
  const shellSort({super.key});

  @override
  State<shellSort> createState() => ShellSort();
}

class ShellSort extends State<shellSort> {
  // variabel form
  final formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  // inputan Array
  var list = [];
  var listSebelum = [];

  void shellSort(List list) {
    int n = list.length;

    // Mulai dengan gap yang besar dan kurangi gap secara iteratif, Pemilihan Gap (Jarak)
    for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
      // Lakukan pengurutan menggunakan gap saat ini
      for (int i = gap; i < n; i++) {
        int key = list[i];
        int j = i;

        // Pindahkan elemen dari posisi yang lebih besar ke posisi yang lebih kecil

        while (j >= gap && list[j - gap] > key) {
          list[j] = list[j - gap];
          j -= gap;
        }
// Tempatkan key pada posisi yang benar di subarray yang diurutkan
        list[j] = key;
      }
    }
  }
// teruskan Pengulangan Hingga Gap Menjadi 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Shell Sort",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 300,
                height: 150,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    color: Colors.cyanAccent),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nama : Ferdinand Sianturi \n Nim : 223303030414 \n Kelas : 3 Malam A',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: _textController,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Data Anda tidak ada'
                            : null,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.input,
                            size: 40,
                            color: Colors.black,
                          ),
                          hintText: "Masukkan angka",
                          hintStyle: const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.lightBlueAccent, width: 2.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.lightBlueAccent, width: 2.5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: double.infinity,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'DATA SEBELUM',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '${listSebelum}',
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(10),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.cyanAccent,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_textController.text.length != 0) {
                                      int data = int.parse(
                                          _textController.text.toString());
                                      list.add(data);
                                      listSebelum.add(data);
                                      _textController.text = "";
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('Data masih kosong'),
                                        ),
                                      );
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.greenAccent),
                                child: const Text(
                                  "Input",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (list.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text('Angka tidak ada!'),
                                        ),
                                      );
                                    } else {
                                      list.clear();
                                      listSebelum.clear();
                                      _textController.clear();
                                      _textController.text = "";
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.redAccent,
                                          content:
                                              Text('Angka berhasil di clear'),
                                        ),
                                      );
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent),
                                child: const Text(
                                  "Clear",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: double.infinity,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'DATA SETELAH',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '${list}',
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(10),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          List<int> listSebelum = List.from(list);
                          setState(() {
                            shellSort(list);

                            debugPrint('Sebelum sorting: ${listSebelum}');

                            debugPrint('Setelah sorting: ${list}');
                          });
                        },
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.greenAccent),
                        child: const Text('URUTKAN'),
                      ),
                    ],
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
