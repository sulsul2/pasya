import 'package:flutter/material.dart';
import 'package:pasya/theme.dart';
import 'package:pasya/ui/widgets/condition_tab.dart';
import 'package:pasya/ui/widgets/form_input.dart';
import 'package:pasya/ui/widgets/header.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 120),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Foto Produk',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/detail_shop_2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 48,
                          color: blueColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormInput(
                    textController: productNameController,
                    hintText: 'Masukkan nama produk',
                    label: 'Nama Produk'),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    textController: priceController,
                    hintText: 'Masukkan harga produk dalam rupiah',
                    label: 'Harga Produk'),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    textController: descriptionController,
                    hintText: 'Masukkan deskripsi produk',
                    label: 'Deskripsi Produk'),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Informasi produk',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(parameter: 'Kondisi Barang', value: 'Baru'),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(parameter: 'Kondisi Barang', value: 'Baru'),
                const SizedBox(
                  height: 8,
                ),
                const ConditionTab(parameter: 'Kondisi Barang', value: 'Baru'),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          content(),
          const Header(
            text: 'Tambah Produk',
            back: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Tambah Produk',
                              style: blackText.copyWith(
                                  fontSize: 16, fontWeight: semibold)),
                        ],
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
