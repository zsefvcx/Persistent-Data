
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

part 'users_bloc.freezed.dart';

@injectable
class UsersModelData {

  final bool timeOut;
  final AUsersEntity data;
  final bool error;
  final String e;

  bool get isLoaded => data.users.isNotEmpty;
  bool get isTimeOut => timeOut;
  bool get isError => error;

  const UsersModelData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  UsersModelData copyWith({
    AUsersEntity? data,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return UsersModelData(
      data: data ?? this.data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}

@freezed
class UsersBlocState with _$UsersBlocState{
  const factory UsersBlocState.loading() = _loadingState;
  const factory UsersBlocState.loaded({required UsersModelData model}) = _loadedState;
  const factory UsersBlocState.error() = _errorState;
  const factory UsersBlocState.timeOut() = _timeOut;
}

@freezed
class UsersBlocEvent with _$UsersBlocEvent{
  const factory UsersBlocEvent.init() = _initEvent;
  const factory UsersBlocEvent.get({required int page}) = _getEvent;
  const factory UsersBlocEvent.insert({required User value}) = _insertEvent;
  const factory UsersBlocEvent.update({required User oldValue, required User value}) = _updateEvent;
  const factory UsersBlocEvent.delete({required User value}) = _deleteEvent;
}

@injectable
class UsersBloc extends Bloc<UsersBlocEvent, UsersBlocState>{
  final PhotosRepository groupsRepository;


  UsersModelData groupsModelData = const UsersModelData(
    timeOut: false,
    data: UsersModel(<User>[], 0),
    e: '',
    error: false,
  );

  UsersBloc({
    required this.groupsRepository,
  }) : super(const UsersBlocState.loading()) {
    on<UsersBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (_initEvent value) async {
            emit(const UsersBlocState.loading());
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