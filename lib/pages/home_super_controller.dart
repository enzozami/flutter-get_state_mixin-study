import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:get_state_mixin/models/cep_model.dart';
import 'package:get_state_mixin/repository/viacep_repository.dart';

class HomeSuperController extends SuperController<CepModel> {
  final ViacepRepository _repository;
  final _cepSearch = ''.obs;

  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;

  HomeSuperController(
    this._repository,
  );

  @override
  void onReady() {
    change(state, status: RxStatus.empty());
  }

  Future<void> findAddress() async {
    try {
      change(state, status: RxStatus.loading());
      final cep = await _findAddressRepository();
      change(cep, status: RxStatus.success());
    } catch (e) {
      change(state, status: RxStatus.error());
    }
  }

  Future<void> findAddress2() async {
    change(state, status: RxStatus.loading());
    append(() => _findAddressRepository);
  }

  Future<CepModel> _findAddressRepository() async => await _repository.getCep(_cepSearch.value);

  @override
  void onDetached() {
    log('onDetached');
  }

  @override
  void onHidden() {
    log('onHidden');
  }

  @override
  void onInactive() {
    log('onInactive');
  }

  @override
  void onPaused() {
    log('onPaused');
  }

  @override
  void onResumed() {
    log('onResumed');
  }
}
