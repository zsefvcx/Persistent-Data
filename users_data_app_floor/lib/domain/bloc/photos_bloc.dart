
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

part 'photos_bloc.freezed.dart';

@injectable
class PhotosModelData {

  final bool timeOut;
  final AUsersEntity data;
  final bool error;
  final String e;

  bool get isLoaded => data.users.isNotEmpty;
  bool get isTimeOut => timeOut;
  bool get isError => error;

  const PhotosModelData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  PhotosModelData copyWith({
    AUsersEntity? data,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return PhotosModelData(
      data: data ?? this.data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}

@freezed
class PhotosBlocState with _$GroupsBlocState{
  const factory PhotosBlocState.loading() = _loadingState;
  const factory PhotosBlocState.loaded({required PhotosModelData model}) = _loadedState;
  const factory PhotosBlocState.error() = _errorState;
  const factory PhotosBlocState.timeOut() = _timeOut;
}

@freezed
class PhotosBlocEvent with _$GroupsBlocEvent{
  const factory PhotosBlocEvent.init() = _initEvent;
  const factory PhotosBlocEvent.get({required int page}) = _getEvent;
  const factory PhotosBlocEvent.insert({required User value}) = _insertEvent;
  const factory PhotosBlocEvent.update({required User oldValue, required User value}) = _updateEvent;
  const factory PhotosBlocEvent.delete({required User value}) = _deleteEvent;
}

@injectable
class PhotosBloc extends Bloc<PhotosBlocEvent, PhotosBlocState>{
  final PhotosRepository groupsRepository;


  PhotosModelData groupsModelData = const PhotosModelData(
    timeOut: false,
    data: UsersModel(<User>[], 0),
    e: '',
    error: false,
  );

  PhotosBloc({
    required this.groupsRepository,
  }) : super(const PhotosBlocState.loading()) {
    on<PhotosBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (_initEvent value) async {
            emit(const PhotosBlocState.loading());
            await _get(0);
            _response(emit);
          },
          getGroups: (_getEvent value) async {
            emit(const PhotosBlocState.loading());
            await _get(value.page);
            _response(emit);
          },
          insertGroup: (_insertEvent value) async {
            emit(const PhotosBlocState.loading());
            await _insert(value.value);
            _response(emit);
          },
          updateGroup: (_updateEvent value) async {
            await _update(value.oldValue, value.value);
          },
          deleteGroup: (_deleteEvent value) async {
            emit(const PhotosBlocState.loading());
            await _delete(value.value);
            _response(emit);
          }

      );

    });

  }

  Future<Uint8List> getUint8List(String locator) async {
    return (await PhotoReadFromIntFile().readCounter(uuid: locator)).$1;
  }

  Future<String> writeToFile(String url , [String? locator]) async {
    return (await PhotoReadFromIntFile().writeCounter(url, locator)).$2;
  }


  void _response(Emitter<PhotosBlocState> emit){
    if (groupsModelData.error){
      if(groupsModelData.timeOut){
        emit(const PhotosBlocState.timeOut());
      } else {
        emit(const PhotosBlocState.error());
      }
    } else{
      emit(PhotosBlocState.loaded(model: groupsModelData));
    }
  }

  Future<void> _get(int page) async {
    AUsersEntity? groupsModel;
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      //получаем первую страницу при инициализации
      var res = await groupsRepository.getGroups(page).timeout(const Duration(seconds: 2),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return null;
          });
      if (res != null) {
        groupsModel = UsersModel(res, page);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    groupsModelData = groupsModelData.copyWith(
      data: groupsModel,
      timeOut: timeOut,
      e: e,
      error: error,
    );

  }

  Future<void> _insert(User value) async {
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      var res = await groupsRepository.insertGroup(value).timeout(const Duration(seconds: 2),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return null;
          });
      if (res != null) {
        groupsModelData.data.users.add(res);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    groupsModelData = groupsModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }

  Future<void> _update(User oldValue, User value) async {
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      var res = await groupsRepository.updateGroup(value).timeout(const Duration(seconds: 2),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return 0;
          });
      if (res > 0) {
        groupsModelData.data.users.remove(oldValue);
        groupsModelData.data.users.add(value);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    groupsModelData = groupsModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }

  Future<void> _delete(User value) async {
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      var res = await groupsRepository.deleteGroup(value).timeout(const Duration(seconds: 2),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return 0;
          });
      if (res > 0)
      {
        groupsModelData.data.users.remove(value);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    groupsModelData = groupsModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }
}