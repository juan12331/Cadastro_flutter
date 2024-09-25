import 'dart:async';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splashscreen> {
  String _displayText = 'Jacksons';
  int _dotCount = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    // Atualiza o texto a cada 500 milissegundos
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount + 1) % 4; // Cicla entre 0 a 3
        _displayText = 'Jacksons' + '.' * _dotCount; // Adiciona os pontos
      });
    });

    // Navega para a tela de login após 3 segundos
    Future.delayed(const Duration(seconds: 4), () {
      _timer?.cancel(); // Cancela o timer ao navegar
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Garante que o timer seja cancelado ao descartar o widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Center(
          child: Text(
            _displayText,
            style: const TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
      ),
    );
  }
}
