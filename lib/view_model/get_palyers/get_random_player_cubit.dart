import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_random_player_state.dart';

class GetRandomPlayerCubit extends Cubit<GetRandomPlayerState> {
  GetRandomPlayerCubit() : super(GetRandomPlayerInitial());


  static GetRandomPlayerCubit get(context) => BlocProvider.of(context);
  final FirebaseStorage storage = FirebaseStorage.instance;
  String imageUrl = '';
  String imageName = '';
  bool isLoading = false;
  String fileName= '';
  String fileLevel ='';

   Future getRandomPlayer(String file) async{
    emit(GetRandomPlayerLoading());
   try {
      final storageRef = storage.ref().child("$file/");
      final ListResult allPlayers = await storageRef.listAll();
      final randomIndex = Random().nextInt(allPlayers.items.length);
      final imageData = allPlayers.items[randomIndex];
      imageUrl = await imageData.getDownloadURL();
      final imageFullName = imageData.name;
      final parts = imageFullName.split(".");
      imageName = parts[0];
      emit(GetRandomPlayerSuccess(
          randomPlayerImage: imageUrl, randomPlayerName: imageName));
    }catch(e){
     emit(GetRandomPlayerError(errorMessage: "Error Message: $e"));
   }
  }

}
