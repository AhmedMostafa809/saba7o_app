part of 'get_random_player_cubit.dart';

@immutable
abstract class GetRandomPlayerState {}

class GetRandomPlayerInitial extends GetRandomPlayerState {}

class GetRandomPlayerSuccess extends GetRandomPlayerState {
  final String randomPlayerImage;
  final String randomPlayerName;

  GetRandomPlayerSuccess({required this.randomPlayerImage, required this.randomPlayerName});


}

class GetRandomPlayerLoading extends GetRandomPlayerState {}

class GetRandomPlayerError extends GetRandomPlayerState {
  final String errorMessage;

  GetRandomPlayerError({required this.errorMessage});
}

