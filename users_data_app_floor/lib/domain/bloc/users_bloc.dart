
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/data/data.dart';
import 'package:users_data_app_floor/domain/domain.dart';

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
  const factory UsersBlocEvent.get({required int page}) = _getEvent;//Completer
  const factory UsersBlocEvent.getCompleter({required int page, required Completer<dynamic> completer}) = _getCompleterEvent;
  const factory UsersBlocEvent.insert({required User value}) = _insertEvent;
  const factory UsersBlocEvent.update({required User oldValue, required User value}) = _updateEvent;
  const factory UsersBlocEvent.insertCard({required CardDetail value}) = _insertCardEvent;
  const factory UsersBlocEvent.updateCard({required CardDetail value}) = _updateCardEvent;
  const factory UsersBlocEvent.delete({required User value}) = _deleteEvent;
}

@injectable
class UsersBloc extends Bloc<UsersBlocEvent, UsersBlocState>{
  final UsersRepository usersRepository;
  final PhotoReadRepository photoReadRepository;
  final CardSecureRepository cardSecureRepository;

  static int timeOutV = 10;

  UsersModelData usersModelData = const UsersModelData(
    timeOut: false,
    data: UsersModel(<User>{}, 0),
    e: '',
    error: false,
  );

  UsersBloc({
    required this.photoReadRepository,
    required this.usersRepository,
    required this.cardSecureRepository,
  }) : super(const UsersBlocState.loading()) {
    on<UsersBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) async {
            emit(const UsersBlocState.loading());
            await _get(0);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
          },
          get: (value) async {
            emit(const UsersBlocState.loading());
            await _get(value.page);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
          },
          getCompleter: (value) async {
            await _get(value.page);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
            value.completer.complete();
          },
          insert: (value) async {
            emit(const UsersBlocState.loading());
            await _insert(value.value);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
          },
          update: (value) async {
            await _update(value.oldValue, value.value);
           // await Future.delayed(const Duration(seconds: 2));
          },
          delete: (value) async {
            emit(const UsersBlocState.loading());
            await _delete(value.value);
            //await Future.delayed(const Duration(seconds: 2));
            _response(emit);
          },
          insertCard: (value) async {
            final (_, _, _) = await _insertCard(value: value.value);
          },
          updateCard: (value) async {
            final (_, _, _) = await _updateCard(value: value.value);
          },
      )
      ;
    });
  }

  Future<(bool, bool, bool?)> _insertCard({required CardDetail value}) async {
    var error = false;
    var timeOut = false;
    bool? res;
    try{
      res = await cardSecureRepository.insertCard(value: value).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<(bool, bool, CardDetail?)> readCard({required String uuidUser}) async {
    var error = false;
    var timeOut = false;
    CardDetail? res;
    try{
      res = await cardSecureRepository.readCard(uuidUser: uuidUser).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<(bool, bool, bool?)> _updateCard({required CardDetail value}) async {
    var error = false;
    var timeOut = false;
    bool? res;
    try{
      res = await cardSecureRepository.updateCard(value: value).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<(bool, bool, bool?)> _deleteCard({required String uuidUser}) async {
    var error = false;
    var timeOut = false;
    bool? res;
    try{
      res = await cardSecureRepository.deleteCard(uuidUser: uuidUser).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<APhotosModel?> getUint8List(String locator, String url) async {
    APhotosModel? res;
    try{
      res = await photoReadRepository.readCounter(locator: locator, url: url);
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    return res;
  }

  Future<(bool, bool, String?)> _insertPhoto({required String url, String? locator}) async {
    var error = false;
    var timeOut = false;
    String? res;
    try{
      res = (await photoReadRepository.writeCounter(url: url, locator: locator).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return (null, null);
          })

      ).$2;
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  Future<(bool, bool, bool?)> _deletePhoto({required String locator}) async {
    var error = false;
    var timeOut = false;
    bool? res;
    try{
      res = await photoReadRepository.deletePhoto(locator: locator).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut  = true;
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
    }
    return (error, timeOut, res);
  }

  void _response(Emitter<UsersBlocState> emit){
    if (usersModelData.error){
      if(usersModelData.timeOut){
        emit(const UsersBlocState.timeOut());
      } else {
        emit(const UsersBlocState.error());
      }
    } else{
      emit(UsersBlocState.loaded(model: usersModelData));
    }
  }

  Future<void> _get(int page) async {
    AUsersEntity? groupsModel;
    String? e;
    var error = false;
    bool? timeOut;
    try {
      //получаем первую страницу при инициализации
      final res = await usersRepository.get(page: page).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return null;
          });
      if (res != null) {
        final AUsersEntity getModel = UsersModel(res.toSet(), page);
        if(getModel == usersModelData.data){
          Logger.print('Identical! No need load data.', name: 'err', error: true);
        } else {
          groupsModel = getModel;
        }

      }
    } on Exception catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    usersModelData = usersModelData.copyWith(
      data: groupsModel,
      timeOut: timeOut,
      e: e,
      error: error,
    );

  }

  Future<void> _insert(User value) async {
    String? e;
    var error = false;
    bool? timeOut;
    try {
      final locator= (await _insertPhoto(url: value.image, locator: value.locator)).$3;
      if(locator == null) {
        Logger.print('Image is not loaded');
      }
      final valueRes = value.copyWith(
        locator: locator,
      );
      final res = await usersRepository.insert(value: valueRes).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return null;
          });
      if (res != null) {
        usersModelData.data.users.add(res);
      }
    } on Exception catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    usersModelData = usersModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }

  Future<void> _update(User oldValue, User value) async {
    String? e;
    var error = false;
    bool? timeOut;
    try {
      var valueRes = value;
      if(value.image != oldValue.image || oldValue.locator == null){
        final locator= (await _insertPhoto(url: value.image, locator: value.locator)).$3;
        if(locator == null) {
          Logger.print('Image is not loaded');
        }
        valueRes = value.copyWith(
          locator: locator,
        );
      }
      final res = await usersRepository.update(value: valueRes).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return 0;
          });
      if (res > 0) {
        usersModelData.data.users.remove(oldValue);
        usersModelData.data.users.add(value);
      }
    } on Exception catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    usersModelData = usersModelData.copyWith(
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
      await _deleteCard(uuidUser: value.uuid);
      await _deletePhoto(locator: value.locator??'');
      final res = await usersRepository.delete(value: value).timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return 0xFF;
          });
      if (res > 0)
      {
        usersModelData.data.users.remove(value);
      }
    } on Exception catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print('$ee\n$t', name: 'err', error: true);
    }
    usersModelData = usersModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }
}
