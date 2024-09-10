import 'package:flutter/material.dart';
import 'cadastro.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
          // Container for the form
          Positioned.fill(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(13.5),
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 400,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.5),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title text at the top of the form
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
                    // Form fields
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail),
                        hintText: "Informe o email",
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: "Informe a senha",
                        suffixIcon: GestureDetector(
                          child: Icon(
                            Icons.visibility_off,
                          ),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    // Button and other text elements
                    ElevatedButton(
  onPressed: () {},
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
                    Divider(),
                    Text(
                      "Esqueci a senha",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          // Positioned Text above the form
          
        ],
      ),
    );
  }
}
