import 'package:cinema_plus/core/bloc/data_cubit/data_state.dart';
import 'package:cinema_plus/core/services/actor_service.dart';
import 'package:cinema_plus/core/services/genre_service.dart';
import 'package:cinema_plus/core/services/movie_service.dart';
import 'package:cinema_plus/core/services/series_service.dart';
import 'package:cinema_plus/features/model/actor_model.dart';
import 'package:cinema_plus/features/model/movie_model.dart';
import 'package:cinema_plus/features/model/series_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(
    this.movieService,
    this.seriesService,
    this.actorService,
    this.genreService,
  ) : super(DataLoading());
  MovieService movieService;
  SeriesService seriesService;
  ActorService actorService;
  GenreService genreService;
  late List<MovieModel> popularMovies;
  late List<MovieModel> topRatedMovies;
  late MovieModel moviePage;
  late List<SeriesModel> popularSeries;
  late List<SeriesModel> topRatedSeries;
  late SeriesModel seriePage;
  late ActorModel actorPage;
  late List<dynamic> genres;

  void getExplore() async {
    emit(DataLoading());
    try {
      popularMovies = await movieService.getPopular();
      topRatedMovies = await movieService.getTopRated();
      popularSeries = await seriesService.getPopular();
      topRatedSeries = await seriesService.getTopRated();
      emit(DataSuccess());
    } catch (e) {
      emit(DataFailure());
    }
  }

  void getMovieDetails({required int movieId}) async {
    emit(DataLoading());
    try {
      moviePage = await movieService.getMovieDetails(movieId);
      emit(DataSuccess());
    } catch (e) {
      emit(DataFailure());
    }
  }

  void getSerieDetails({required int serieId}) async {
    emit(DataLoading());
    try {
      seriePage = await seriesService.getSeriesDetails(serieId);
      emit(DataSuccess());
    } catch (e) {
      emit(DataFailure());
    }
  }

  void getActorDetails({required int actorId}) async {
    emit(DataLoading());
    try {
      actorPage = await actorService.getActorDetails(actorId);
      emit(DataSuccess());
    } catch (e) {
      emit(DataFailure());
    }
  }

  void getGenre({required int genreId}) async {
    emit(DataLoading());
    try {
      genres = await genreService.getGenre(genreId);
      emit(DataSuccess());
    } catch (e) {
      emit(DataFailure());
    }
  }
}
