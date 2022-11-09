part of 'home_cubit.dart';

enum HomeStatus { loading, success, error }

class HomeState {
  HomeState({
    this.status = HomeStatus.loading,
    this.gifs = const <GifModel>[],
  });
  final HomeStatus status;
  final List<GifModel> gifs;

  HomeState copyWith({
    HomeStatus? status,
    List<GifModel>? gifs,
  }) {
    return HomeState(status: status ?? this.status, gifs: gifs ?? this.gifs);
  }
}
/*
cargando, exito, error
fecth
servicio a API  > 
Repositorio usa el servicio
Cubit usar el repositorio
*/