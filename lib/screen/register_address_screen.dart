import 'package:flutter/material.dart';
import 'package:gigabank_task/component/gigabank_text_field.dart';

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
      appBar: AppBar(
        title: const Text("Register Address"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                const Text(
                    "Please enter the information as written on your ID document."),
                const SizedBox(
                  height: 48,
                ),
                GigabankTextField(
                  controller: _countryController,
                  hintText: "Country",
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
                      return 'Please enter some text';
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data saved')),
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
