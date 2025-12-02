import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Consumer<LoginViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        onChanged: viewModel.setName,
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: "Name",
                          labelStyle: TextStyle(color: Colors.deepPurple),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        onChanged: viewModel.setEmpId,
                        decoration: InputDecoration(
                          hintText: "Enter employee Id",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: "Emp Id",
                          labelStyle: TextStyle(color: Colors.deepPurple),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (viewModel.validate()) {
                            Navigator.pushNamed(context, "/homePage");
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
