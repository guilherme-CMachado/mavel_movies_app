import 'package:marvel_app/api/marvel_api.dart';
import 'package:marvel_app/models/mavelDTO.dart';
import 'package:mobx/mobx.dart';
part 'marvel_controller.g.dart';

class MarvelController = _MarvelControllerBase with _$MarvelController;

abstract class _MarvelControllerBase with Store {
  final _api = MarvelApi();

  @observable
  bool isLoading = false;

  ObservableList<MarvelDTO> marvelObras = ObservableList<MarvelDTO>.of([]);

  @action
  buscarDados() {
    isLoading = true;
    _api.buscarDados().then((response) {
      return marvelObras.addAll(response);
    }).catchError((e) {
      return e;
    });
  }
}
