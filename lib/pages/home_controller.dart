import 'package:get/state_manager.dart';

import 'package:get_state_mixin/repository/viacep_repository.dart';

class HomeController extends GetxController {
  final ViacepRepository _repository;
  HomeController(
    ViacepRepository repository,
  ) : _repository = repository;
}
