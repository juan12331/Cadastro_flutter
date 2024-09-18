import 'package:flutter/material.dart';
import 'cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage; // To hold the error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 54, 69, 79),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 18, 18),
        flexibleSpace: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(13.5),
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.5),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/Perfil.png'),
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.mail),
                            hintText: "Informe o email",
                          ),
                          validator: (String? email) {
                            if (email == null || email == '') {
                              return "O email não pode ser vazio";
                            } 
                            if (email.length < 6) {
                              return "O email está muito curto";
                            } 
                            if (!email.contains("@")) {
                              return "Email inválido";
                            }
                            return '';
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Informe a senha",
                            suffixIcon: GestureDetector(
                              child: Icon(Icons.visibility_off),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              setState(() {
                                _errorMessage = null; // Clear any previous error
                              });
                            } else {
                              setState(() {
                                _errorMessage = "email ou senha incompletos/errados";
                              });
                            }
                          },
                          child: const Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            fixedSize: Size(100, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        if (_errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _errorMessage!,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        Divider(),
                        Text(
                          "Esqueci a senha",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Cadastro()),
                            );
                          },
                          child: const Text(
                            "Cadastre-se",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 5, 160, 0),
                            fixedSize: Size(125, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
