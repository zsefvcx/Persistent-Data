
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
  const factory CategoriesBlocEvent.init({required Group group}) = _initEvent;
  const factory CategoriesBlocEvent.getCategories({required Group group, required int page}) = _getCategoriesEvent;
  const factory CategoriesBlocEvent.insertCategory({required Category value}) = _insertCategoryEvent;
  const factory CategoriesBlocEvent.updateCategory({required Category oldValue, required Category value}) = _updateCategoryEvent;
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
            await _getCategories(value.group, 0);
            _response(emit);
          },
          getCategories: (_getCategoriesEvent value) async {
            emit(const CategoriesBlocState.loading());
            await _getCategories(value.group, value.page);
            _response(emit);
          },
          insertCategory: (_insertCategoryEvent value) async {
            emit(const CategoriesBlocState.loading());
            await _insertCategory(value.value);
            _response(emit);
          },
          updateCategory: (_updateCategoryEvent value) async {
            await _updateCategory(value.oldValue, value.value);
          },
          deleteCategory: (_deleteCategoryEvent value) async {
            emit(const CategoriesBlocState.loading());
            await _deleteCategory(value.value);
            _response(emit);
          }

      );

    });

  }

  void _response(Emitter<CategoriesBlocState> emit){
    if (categoriesModelData.error){
      if(categoriesModelData.timeOut){
        emit(const CategoriesBlocState.timeOut());
      } else {
        emit(const CategoriesBlocState.error());
      }
    } else{
      emit(CategoriesBlocState.loaded(model: categoriesModelData));
    }
  }

  Future<void> _getCategories(Group value, int page) async {
    ACategoriesEntity? categoriesModel;
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      //получаем первую страницу при инициализации
      var res = await categoriesRepository.getCategoriesGroup(value, page).timeout(const Duration(seconds: 2),
          onTimeout: () {
              e = null;
              error = true;
              timeOut  = true;
              return null;
          });
      if (res != null) {
        categoriesModel = CategoriesModel(res, page);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    categoriesModelData = categoriesModelData.copyWith(
      categories: categoriesModel,
      timeOut: timeOut,
      e: e,
      error: error,
    );

  }

  Future<void> _insertCategory(Category value) async {
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      var res = await categoriesRepository.insertCategory(value).timeout(const Duration(seconds: 2),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return null;
          });
      if (res != null) {
        categoriesModelData.categories.categories.add(res);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    categoriesModelData = categoriesModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }

  Future<void> _updateCategory(Category oldValue, Category value) async {
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      var res = await categoriesRepository.updateCategory(oldValue, value).timeout(const Duration(seconds: 2),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return 0;
          });
      if (res > 0) {
        categoriesModelData.categories.categories.remove(oldValue);
        categoriesModelData.categories.categories.add(value);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    categoriesModelData = categoriesModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }

  Future<void> _deleteCategory(Category value) async {
    String? e;
    bool? error = false;
    bool? timeOut;
    try {
      var (res) = await categoriesRepository.deleteCategory(value).timeout(const Duration(seconds: 2),
          onTimeout: () {
            e = null;
            error = true;
            timeOut  = true;
            return 0;
          });
      if (res > 0)
      {
        categoriesModelData.categories.categories.remove(value);
      }
    } catch (ee, t){
      e = ee.toString();
      error = true;
      timeOut  = false;
      Logger.print("$ee\n$t", name: 'err', level: 0, error: false);
    }
    categoriesModelData = categoriesModelData.copyWith(
      timeOut: timeOut,
      e: e,
      error: error,
    );
  }
}