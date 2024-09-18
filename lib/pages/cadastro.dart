import 'package:flutter/material.dart';
import 'login.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

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
                'Cadastro',
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
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title text at the top of the form
                        Image(
                        image: AssetImage(
                            'assets/Perfil.png'), // ou NetworkImage para imagens da web
                        width: 35, // Largura da imagem
                        height: 35, // Altura da imagem
                        fit: BoxFit
                            .cover, // Como a imagem deve se ajustar ao tamanho
                      ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'Cadastra-se',
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
                            icon: Icon(Icons.people_rounded),
                            hintText: "Nome",
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.edit_document),
                            hintText: "CPF",
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone_android),
                            hintText: "celular",
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.mail),
                            hintText: "Email",
                          ),
                        ),
                        SizedBox(height: 16),
                    
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Senha",
                            suffixIcon: GestureDetector(
                              child: Icon(
                                Icons.visibility,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Confirmar Senha",
                            suffixIcon: GestureDetector(
                              child: Icon(
                                Icons.visibility,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                        // Button and other text elements
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
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
                        Divider(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: const Text(
                            "Ja tenho conta",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 5, 160, 0),
                            fixedSize: Size(150, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
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
