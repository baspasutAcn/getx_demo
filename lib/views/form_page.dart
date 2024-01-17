import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/views/product_page_v2.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var firstName = "";
  var lastName = "";
  var email = "";
  var password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "First name"),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => setState(() {
                      firstName = value;
                    }),
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please input some value.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Last name"),
                    onChanged: (value) => setState(() {
                      lastName = value;
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    onChanged: (value) => setState(
                      () {
                        email = value;
                      },
                    ),
                    validator: (value) {
                      if (value != null && value.contains("@")) {
                        return null;
                      } else {
                        return 'Please use email format.';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (value) => setState(() {
                      password = value;
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.dialog(Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(firstName),
                              Text(lastName),
                              Text(email),
                              Text(password),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Get.to(const ProductPageV2());
                                  },
                                  child: const Text("Login"))
                            ],
                          ));
                        }
                      },
                      child: const Text("Submit"))
                ],
              ),
            )),
      ),
    );
  }
}
