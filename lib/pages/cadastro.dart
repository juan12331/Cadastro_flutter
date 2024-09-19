import 'package:flutter/material.dart';
import 'login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage; // Para armazenar mensagens de erro
  bool _isObscured = true;
  bool _isObscuredConfirm = true;
  String? _senha; // Para armazenar a senha para comparação

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
                            'Cadastra-se',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        // Nome
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.people_rounded),
                            hintText: "Nome",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nome não pode ser vazio";
                            }
                            if (value.length > 20) {
                              return "Nome não pode ter mais de 20 caracteres";
                            }
                            if (RegExp(r'\d').hasMatch(value)) {
                              return "Nome não pode conter números";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        // CPF
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.edit_document),
                            hintText: "CPF",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "CPF não pode ser vazio";
                            }
                            if (value.length != 11 ||
                                !RegExp(r'^\d{11}$').hasMatch(value)) {
                              return "CPF deve ter 11 dígitos e não conter letras";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        // Celular
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone_android),
                            hintText: "Celular",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Celular não pode ser vazio";
                            }
                            if (!RegExp(r'^\d+$').hasMatch(value)) {
                              return "Telefone não pode conter letras ou caracteres especiais";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        // Email
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.mail),
                            hintText: "Email",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email não pode ser vazio";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)) {
                              return "Email inválido";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        // Senha
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Senha",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isObscuredConfirm =
                                      !_isObscuredConfirm; // Inverte o valor de _isObscured
                                });
                              },
                              child: Icon(  
                                _isObscuredConfirm
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          obscureText: _isObscuredConfirm,
                          onChanged: (value) =>
                              _senha = value, // Armazenar a senha
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Senha não pode ser vazia";
                            }
                            if (value.length < 8) {
                              return "A senha deve ter pelo menos 8 caracteres";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        // Confirmar Senha
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: "Confirmar Senha",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isObscured =
                                      !_isObscured; // Inverte o valor de _isObscured
                                });
                              },
                              child: Icon(
                                _isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          obscureText: _isObscured,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Confirmar senha não pode ser vazio";
                            }
                            if (value != _senha) {
                              return "As senhas não coincidem";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        // Botão de Cadastro
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Se o formulário for válido, você pode prosseguir com a lógica de cadastro
                              print("Cadastro realizado com sucesso!");
                              Navigator.pushNamed(context, "/");
                            } else {
                              setState(() {
                                _errorMessage =
                                    "Por favor, corrija os erros acima.";
                              });
                            }
                          },
                          child: const Text(
                            "Cadastre",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            fixedSize: Size(115, 35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        if (_errorMessage != null)
                          Text(
                            _errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        Divider(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/");
                          },
                          child: const Text(
                            "Já tenho conta",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 5, 160, 0),
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
        ],
      ),
    );
  }
}
