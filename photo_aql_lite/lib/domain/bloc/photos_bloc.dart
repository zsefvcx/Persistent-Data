
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_aql_lite/core/core.dart';
import 'package:photo_aql_lite/data/data.dart';
import 'package:photo_aql_lite/domain/domain.dart';

part 'groups_bloc.freezed.dart';

@injectable
class GroupsModelData {

  final bool timeOut;
  final AGroupsEntity groups;
  final bool error;
  final String e;

  bool get isLoaded => groups.groups.isNotEmpty;
  bool get isTimeOut => timeOut;
  bool get isError => error;

  const GroupsModelData({
    required this.groups,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  GroupsModelData copyWith({
    AGroupsEntity? groups,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return GroupsModelData(
      groups: groups ?? this.groups,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}

@freezed
class GroupsBlocState with _$GroupsBlocState{
  const factory GroupsBlocState.loading() = _loadingState;
  const factory GroupsBlocState.loaded({required GroupsModelData model}) = _loadedState;
  const factory GroupsBlocState.error() = _errorState;
  const factory GroupsBlocState.timeOut() = _timeOut;
}

@freezed
class GroupsBlocEvent with _$GroupsBlocEvent{
  const factory GroupsBlocEvent.init() = _initEvent;
  const factory GroupsBlocEvent.getGroups({required int page}) = _getGroupsEvent;
  const factory GroupsBlocEvent.insertGroup({required Group value}) = _insertGroupEvent;
  const factory GroupsBlocEvent.updateGroup({required Group oldValue, required Group value}) = _updateGroupEvent;
  const factory GroupsBlocEvent.deleteGroup({required Group value}) = _deleteGroupEvent;
}

@injectable
class GroupsBloc extends Bloc<GroupsBlocEvent, GroupsBlocState>{
  final GroupsRepository groupsRepository;


  GroupsModelData groupsModelData = const GroupsModelData(
    timeOut: false,
    groups: GroupsModel(<Group>[], 0),
    e: '',
    error: false,
  );

  GroupsBloc({
    required this.groupsRepository,
  }) : super(const GroupsBlocState.loading()) {
    on<GroupsBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (_initEvent value) async {
            emit(const GroupsBlocState.loading());
            await _getGroups(0);
            _response(emit);
          },
          getGroups: (_getGroupsEvent value) async {
            emit(const GroupsBlocState.loading());
            await _getGroups(value.page);
            _response(emit);
          },
          insertGroup: (_insertGroupEvent value) async {
            emit(const GroupsBlocState.loading());
            await _insertGroup(value.value);
            _response(emit);
          },
          updateGroup: (_updateGroupEvent value) async {
            await _updateGroup(value.oldValue, value.value);
          },
          deleteGroup: (_deleteGroupEvent value) async {
            emit(const GroupsBlocState.loading());
            await _deleteGroup(value.value);
            _response(emit);
          }

      );

    });

  }

  void _response(Emitter<GroupsBlocState> emit){
    if (groupsModelData.error){
      if(groupsModelData.timeOut){
        emit(const GroupsBlocState.timeOut());
      } else {
        emit(const GroupsBlocState.error());
      }
    } else{
      emit(GroupsBlocState.loaded(model: groupsModelData));
    }
  }

  Future<void> _getGroups(int page) async {
    AGroupsEntity? groupsModel;
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
        groupsModel = GroupsModel(res, page);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    groupsModelData = groupsModelData.copyWith(
      groups: groupsModel,
      timeOut: timeOut,
      e: e,
      error: error,
    );

  }

  Future<void> _insertGroup(Group value) async {
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
        groupsModelData.groups.groups.add(res);
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

  Future<void> _updateGroup(Group oldValue, Group value) async {
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
        groupsModelData.groups.groups.remove(oldValue);
        groupsModelData.groups.groups.add(value);
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

  Future<void> _deleteGroup(Group value) async {
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
        groupsModelData.groups.groups.remove(value);
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