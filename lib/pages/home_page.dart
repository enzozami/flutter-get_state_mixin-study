import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

import 'package:get_state_mixin/models/cep_model.dart';
import 'package:get_state_mixin/pages/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  HomePage({super.key});

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
              TextFormField(
                onChanged: (value) {
                  controller.cepSearch = value;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.findAddress();
                  },
                  child: Text('Buscar')),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return Visibility(
                  visible: controller.loading,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return Visibility(
                  visible: controller.isError,
                  child: Text('Erro ao buscar CEP'),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: !controller.loading,
                  child: CepWidget(controller.cep),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CepWidget extends StatelessWidget {
  final CepModel? cepModel;

  const CepWidget(this.cepModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('CEP: ${cepModel?.cep ?? ''}'),
        Text('Cidade: ${cepModel?.localidade ?? ''}'),
        Text('Rua: ${cepModel?.logradouro ?? ''}'),
        Text('UF: ${cepModel?.uf ?? ''}'),
      ],
    );
  }
}
