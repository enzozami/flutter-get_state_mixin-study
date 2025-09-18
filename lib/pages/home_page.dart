import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Endereço por CEP'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(),
              ElevatedButton(onPressed: () {}, child: Text('Buscar')),
              SizedBox(
                height: 20,
              ),
              CepWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CepWidget extends StatelessWidget {
  const CepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('CEP:'),
        Text('Cidade:'),
        Text('Rua:'),
        Text('UF:'),
      ],
    );
  }
}
