import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';

import 'package:get_state_mixin/repository/viacep_repository.dart';

class HomeControllerStateMixin extends GetxController with StateMixin<CepModel> {
  final ViacepRepository _repository;
  final _cepSearch = ''.obs;

  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;

  HomeControllerStateMixin(
    this._repository,
  );

  @override
  void onReady() {
    change(state, status: RxStatus.empty());
  }

  Future<void> findAddress() async {
    try {
      change(state, status: RxStatus.loading());
      final cep = await _repository.getCep(_cepSearch.value);
      change(cep, status: RxStatus.success());
    } catch (e) {
      change(state, status: RxStatus.error());
    }
  }
}
