
import 'dart:async';

import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/data/data.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'categories_bloc.freezed.dart';

@injectable
class CategoriesModelData {

  final bool timeOut;
  final ACategoriesEntity categories;
  final bool error;
  final String e;

  bool get isLoaded => categories.categories.isNotEmpty;
  bool get isTimeOut => timeOut;
  bool get isError => error;

  const CategoriesModelData({
    required this.categories,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  CategoriesModelData copyWith({
    ACategoriesEntity? categories,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return CategoriesModelData(
      categories: categories ?? this.categories,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}

@freezed
class CategoriesBlocState with _$CategoriesBlocState{
  const factory CategoriesBlocState.loading() = _loadingState;
  const factory CategoriesBlocState.loaded({required CategoriesModelData model}) = _loadedState;
  const factory CategoriesBlocState.error() = _errorState;
  const factory CategoriesBlocState.timeOut() = _timeOut;
}

@freezed
class CategoriesBlocEvent with _$CategoriesBlocEvent{
  const factory CategoriesBlocEvent.init() = _initEvent;
  const factory CategoriesBlocEvent.getCategories({required int page}) = _getCategoriesEvent;
  const factory CategoriesBlocEvent.insertCategory({required Category value}) = _insertCategoryEvent;
  const factory CategoriesBlocEvent.updateCategory({required Category oldValue, required Group value}) = _updateCategoryEvent;
  const factory CategoriesBlocEvent.deleteCategory({required Category value}) = _deleteCategoryEvent;
}

@injectable
class CategoriesBloc extends Bloc<CategoriesBlocEvent, CategoriesBlocState>{
  final CategoriesRepository categoriesRepository;


  CategoriesModelData categoriesModelData = const CategoriesModelData(
    timeOut: false,
    categories: CategoriesModel(<Category>[], 0),
    e: '',
    error: false,
  );

  CategoriesBloc({
    required this.categoriesRepository,
  }) : super(const CategoriesBlocState.loading()) {
    on<CategoriesBlocEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (_initEvent value) async {
            emit(const CategoriesBlocState.loading());
            //await _getGroups(0);
            emit(CategoriesBlocState.loaded(model: categoriesModelData));
          },
          getCategories: (_getCategoriesEvent value) async {
            emit(const CategoriesBlocState.loading());
            //await _getGroups(value.page);
            emit(CategoriesBlocState.loaded(model: categoriesModelData));
          },
          insertCategory: (_insertCategoryEvent value) async {
            emit(const CategoriesBlocState.loading());
            //await _insertGroup(value.value);
            emit(CategoriesBlocState.loaded(model: categoriesModelData));
          },
          updateCategory: (_updateCategoryEvent value) async {
           // await _updateGroup(value.oldValue, value.value);
          },
          deleteCategory: (_deleteCategoryEvent value) async {
            emit(const CategoriesBlocState.loading());
            //await _deleteGroup(value.value);
            emit(CategoriesBlocState.loaded(model: categoriesModelData));
          }

      );

    });

  }

  // Future<void> _getGroups(int page) async {
  //   AGroupsEntity? groupsModel;
  //   String? e;
  //   bool? error = false;
  //   bool? timeOut;
  //   try {
  //     //получаем первую страницу при инициализации
  //     var res = await groupsRepository.getGroups(page).timeout(const Duration(seconds: 2),
  //         onTimeout: () {
  //           e = null;
  //           error = true;
  //           timeOut  = true;
  //           return null;
  //         });
  //     if (res != null) {
  //       groupsModel = GroupsModel(res, page);
  //     }
  //   } catch (ee){
  //     e = ee.toString();
  //     error = true;
  //     timeOut  = false;
  //   }
  //   groupsModelData = groupsModelData.copyWith(
  //     groups: groupsModel,
  //     timeOut: timeOut,
  //     e: e,
  //     error: error,
  //   );
  //
  // }
  //
  // Future<void> _insertGroup(Group value) async {
  //   String? e;
  //   bool? error = false;
  //   bool? timeOut;
  //   try {
  //     var res = await groupsRepository.insertGroup(value).timeout(const Duration(seconds: 2),
  //         onTimeout: () {
  //           e = null;
  //           error = true;
  //           timeOut  = true;
  //           return null;
  //         });
  //     if (res != null) {
  //       groupsModelData.groups.group.add(res);
  //     }
  //   } catch (ee){
  //     e = ee.toString();
  //     error = true;
  //     timeOut  = false;
  //   }
  //   groupsModelData = groupsModelData.copyWith(
  //     timeOut: timeOut,
  //     e: e,
  //     error: error,
  //   );
  // }
  //
  // Future<void> _updateGroup(Group oldValue, Group value) async {
  //   String? e;
  //   bool? error = false;
  //   bool? timeOut;
  //   try {
  //     var res = await groupsRepository.updateGroup(value).timeout(const Duration(seconds: 2),
  //         onTimeout: () {
  //           e = null;
  //           error = true;
  //           timeOut  = true;
  //           return 0;
  //         });
  //     if (res > 0) {
  //       groupsModelData.groups.group.remove(oldValue);
  //       groupsModelData.groups.group.add(value);
  //     }
  //   } catch (ee){
  //     e = ee.toString();
  //     error = true;
  //     timeOut  = false;
  //   }
  //   groupsModelData = groupsModelData.copyWith(
  //     timeOut: timeOut,
  //     e: e,
  //     error: error,
  //   );
  // }
  //
  // Future<void> _deleteGroup(Group value) async {
  //   String? e;
  //   bool? error = false;
  //   bool? timeOut;
  //   try {
  //     var (resG, resC) = await groupsRepository.deleteGroup(value).timeout(const Duration(seconds: 2),
  //         onTimeout: () {
  //           e = null;
  //           error = true;
  //           timeOut  = true;
  //           return (0, 0);
  //         });
  //     if (resG > 0)
  //     {
  //       groupsModelData.groups.group.remove(value);
  //     }
  //   } catch (ee){
  //     e = ee.toString();
  //     error = true;
  //     timeOut  = false;
  //   }
  //   groupsModelData = groupsModelData.copyWith(
  //     timeOut: timeOut,
  //     e: e,
  //     error: error,
  //   );
  // }
}