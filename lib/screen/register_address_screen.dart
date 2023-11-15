import 'package:flutter/material.dart';
import 'package:gigabank_task/component/gigabank_text_field.dart';
import 'package:gigabank_task/model/address_model.dart';

class RegisterAddressScreen extends StatefulWidget {
  const RegisterAddressScreen({super.key});

  @override
  State<RegisterAddressScreen> createState() => _RegisterAddressScreenState();
}

class _RegisterAddressScreenState extends State<RegisterAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _prefectureController = TextEditingController();
  final TextEditingController _municipalityController = TextEditingController();
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();

  @override
  void dispose() {
    _countryController.dispose();
    _prefectureController.dispose();
    _municipalityController.dispose();
    _streetAddressController.dispose();
    _apartmentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        title: const Text(
          "Register Address",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF4c1ea6),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(6),
          child: LinearProgressIndicator(
            value: 0.5,
            minHeight: 6,
            backgroundColor: Color(0xFFf1ebf9),
            color: Color(0xFFffb03b),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Please enter the information as written\non your ID document.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GigabankTextField(
                  controller: _countryController,
                  hintText: "Country",
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter country';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                GigabankTextField(
                  controller: _prefectureController,
                  hintText: "Prefecture",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter prefecture';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                GigabankTextField(
                  controller: _municipalityController,
                  hintText: "Municipality",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter municipality';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                GigabankTextField(
                  controller: _streetAddressController,
                  hintText: "Street address (subarea - block - house ...",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter street address';
                    }

                    final RegExp regex =
                        RegExp(r'^[a-zA-Z0-9]+-[a-zA-Z0-9]+-[a-zA-Z0-9]+$');
                    if (!regex.hasMatch(value)) {
                      return 'Invalid format. e.g. "subarea-block-house"';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                GigabankTextField(
                  controller: _apartmentController,
                  hintText: "Apartment, suite or unit",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final userAddress = UserAddress(
                      country: _countryController.text.trim(),
                      prefecture: _prefectureController.text.trim(),
                      municipality: _municipalityController.text.trim(),
                      streetAddress: _streetAddressController.text.trim(),
                      apartment: _apartmentController.text.trim(),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User Address saved in object'),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF4c1ea6),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
