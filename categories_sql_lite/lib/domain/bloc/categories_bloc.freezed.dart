// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoriesBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CategoriesModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CategoriesModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CategoriesModelData model)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesBlocStateCopyWith<$Res> {
  factory $CategoriesBlocStateCopyWith(
          CategoriesBlocState value, $Res Function(CategoriesBlocState) then) =
      _$CategoriesBlocStateCopyWithImpl<$Res, CategoriesBlocState>;
}

/// @nodoc
class _$CategoriesBlocStateCopyWithImpl<$Res, $Val extends CategoriesBlocState>
    implements $CategoriesBlocStateCopyWith<$Res> {
  _$CategoriesBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadingStateCopyWith<$Res> {
  factory _$$_loadingStateCopyWith(
          _$_loadingState value, $Res Function(_$_loadingState) then) =
      __$$_loadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadingStateCopyWithImpl<$Res>
    extends _$CategoriesBlocStateCopyWithImpl<$Res, _$_loadingState>
    implements _$$_loadingStateCopyWith<$Res> {
  __$$_loadingStateCopyWithImpl(
      _$_loadingState _value, $Res Function(_$_loadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loadingState implements _loadingState {
  const _$_loadingState();

  @override
  String toString() {
    return 'CategoriesBlocState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CategoriesModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CategoriesModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CategoriesModelData model)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements CategoriesBlocState {
  const factory _loadingState() = _$_loadingState;
}

/// @nodoc
abstract class _$$_loadedStateCopyWith<$Res> {
  factory _$$_loadedStateCopyWith(
          _$_loadedState value, $Res Function(_$_loadedState) then) =
      __$$_loadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({CategoriesModelData model});
}

/// @nodoc
class __$$_loadedStateCopyWithImpl<$Res>
    extends _$CategoriesBlocStateCopyWithImpl<$Res, _$_loadedState>
    implements _$$_loadedStateCopyWith<$Res> {
  __$$_loadedStateCopyWithImpl(
      _$_loadedState _value, $Res Function(_$_loadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_loadedState(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as CategoriesModelData,
    ));
  }
}

/// @nodoc

class _$_loadedState implements _loadedState {
  const _$_loadedState({required this.model});

  @override
  final CategoriesModelData model;

  @override
  String toString() {
    return 'CategoriesBlocState.loaded(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadedState &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadedStateCopyWith<_$_loadedState> get copyWith =>
      __$$_loadedStateCopyWithImpl<_$_loadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CategoriesModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loaded(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CategoriesModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loaded?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CategoriesModelData model)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _loadedState implements CategoriesBlocState {
  const factory _loadedState({required final CategoriesModelData model}) =
      _$_loadedState;

  CategoriesModelData get model;
  @JsonKey(ignore: true)
  _$$_loadedStateCopyWith<_$_loadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_errorStateCopyWith<$Res> {
  factory _$$_errorStateCopyWith(
          _$_errorState value, $Res Function(_$_errorState) then) =
      __$$_errorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_errorStateCopyWithImpl<$Res>
    extends _$CategoriesBlocStateCopyWithImpl<$Res, _$_errorState>
    implements _$$_errorStateCopyWith<$Res> {
  __$$_errorStateCopyWithImpl(
      _$_errorState _value, $Res Function(_$_errorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_errorState implements _errorState {
  const _$_errorState();

  @override
  String toString() {
    return 'CategoriesBlocState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_errorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CategoriesModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CategoriesModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CategoriesModelData model)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _errorState implements CategoriesBlocState {
  const factory _errorState() = _$_errorState;
}

/// @nodoc
abstract class _$$_timeOutCopyWith<$Res> {
  factory _$$_timeOutCopyWith(
          _$_timeOut value, $Res Function(_$_timeOut) then) =
      __$$_timeOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_timeOutCopyWithImpl<$Res>
    extends _$CategoriesBlocStateCopyWithImpl<$Res, _$_timeOut>
    implements _$$_timeOutCopyWith<$Res> {
  __$$_timeOutCopyWithImpl(_$_timeOut _value, $Res Function(_$_timeOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_timeOut implements _timeOut {
  const _$_timeOut();

  @override
  String toString() {
    return 'CategoriesBlocState.timeOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_timeOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CategoriesModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CategoriesModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CategoriesModelData model)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class _timeOut implements CategoriesBlocState {
  const factory _timeOut() = _$_timeOut;
}

/// @nodoc
mixin _$CategoriesBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getCategories,
    required TResult Function(Category value) insertCategory,
    required TResult Function(Category oldValue, Group value) updateCategory,
    required TResult Function(Category value) deleteCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getCategories,
    TResult? Function(Category value)? insertCategory,
    TResult? Function(Category oldValue, Group value)? updateCategory,
    TResult? Function(Category value)? deleteCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getCategories,
    TResult Function(Category value)? insertCategory,
    TResult Function(Category oldValue, Group value)? updateCategory,
    TResult Function(Category value)? deleteCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getCategoriesEvent value) getCategories,
    required TResult Function(_insertCategoryEvent value) insertCategory,
    required TResult Function(_updateCategoryEvent value) updateCategory,
    required TResult Function(_deleteCategoryEvent value) deleteCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getCategoriesEvent value)? getCategories,
    TResult? Function(_insertCategoryEvent value)? insertCategory,
    TResult? Function(_updateCategoryEvent value)? updateCategory,
    TResult? Function(_deleteCategoryEvent value)? deleteCategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getCategoriesEvent value)? getCategories,
    TResult Function(_insertCategoryEvent value)? insertCategory,
    TResult Function(_updateCategoryEvent value)? updateCategory,
    TResult Function(_deleteCategoryEvent value)? deleteCategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesBlocEventCopyWith<$Res> {
  factory $CategoriesBlocEventCopyWith(
          CategoriesBlocEvent value, $Res Function(CategoriesBlocEvent) then) =
      _$CategoriesBlocEventCopyWithImpl<$Res, CategoriesBlocEvent>;
}

/// @nodoc
class _$CategoriesBlocEventCopyWithImpl<$Res, $Val extends CategoriesBlocEvent>
    implements $CategoriesBlocEventCopyWith<$Res> {
  _$CategoriesBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initEventCopyWith<$Res> {
  factory _$$_initEventCopyWith(
          _$_initEvent value, $Res Function(_$_initEvent) then) =
      __$$_initEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initEventCopyWithImpl<$Res>
    extends _$CategoriesBlocEventCopyWithImpl<$Res, _$_initEvent>
    implements _$$_initEventCopyWith<$Res> {
  __$$_initEventCopyWithImpl(
      _$_initEvent _value, $Res Function(_$_initEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initEvent implements _initEvent {
  const _$_initEvent();

  @override
  String toString() {
    return 'CategoriesBlocEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getCategories,
    required TResult Function(Category value) insertCategory,
    required TResult Function(Category oldValue, Group value) updateCategory,
    required TResult Function(Category value) deleteCategory,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getCategories,
    TResult? Function(Category value)? insertCategory,
    TResult? Function(Category oldValue, Group value)? updateCategory,
    TResult? Function(Category value)? deleteCategory,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getCategories,
    TResult Function(Category value)? insertCategory,
    TResult Function(Category oldValue, Group value)? updateCategory,
    TResult Function(Category value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getCategoriesEvent value) getCategories,
    required TResult Function(_insertCategoryEvent value) insertCategory,
    required TResult Function(_updateCategoryEvent value) updateCategory,
    required TResult Function(_deleteCategoryEvent value) deleteCategory,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getCategoriesEvent value)? getCategories,
    TResult? Function(_insertCategoryEvent value)? insertCategory,
    TResult? Function(_updateCategoryEvent value)? updateCategory,
    TResult? Function(_deleteCategoryEvent value)? deleteCategory,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getCategoriesEvent value)? getCategories,
    TResult Function(_insertCategoryEvent value)? insertCategory,
    TResult Function(_updateCategoryEvent value)? updateCategory,
    TResult Function(_deleteCategoryEvent value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements CategoriesBlocEvent {
  const factory _initEvent() = _$_initEvent;
}

/// @nodoc
abstract class _$$_getCategoriesEventCopyWith<$Res> {
  factory _$$_getCategoriesEventCopyWith(_$_getCategoriesEvent value,
          $Res Function(_$_getCategoriesEvent) then) =
      __$$_getCategoriesEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_getCategoriesEventCopyWithImpl<$Res>
    extends _$CategoriesBlocEventCopyWithImpl<$Res, _$_getCategoriesEvent>
    implements _$$_getCategoriesEventCopyWith<$Res> {
  __$$_getCategoriesEventCopyWithImpl(
      _$_getCategoriesEvent _value, $Res Function(_$_getCategoriesEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_getCategoriesEvent(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_getCategoriesEvent implements _getCategoriesEvent {
  const _$_getCategoriesEvent({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'CategoriesBlocEvent.getCategories(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getCategoriesEvent &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_getCategoriesEventCopyWith<_$_getCategoriesEvent> get copyWith =>
      __$$_getCategoriesEventCopyWithImpl<_$_getCategoriesEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getCategories,
    required TResult Function(Category value) insertCategory,
    required TResult Function(Category oldValue, Group value) updateCategory,
    required TResult Function(Category value) deleteCategory,
  }) {
    return getCategories(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getCategories,
    TResult? Function(Category value)? insertCategory,
    TResult? Function(Category oldValue, Group value)? updateCategory,
    TResult? Function(Category value)? deleteCategory,
  }) {
    return getCategories?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getCategories,
    TResult Function(Category value)? insertCategory,
    TResult Function(Category oldValue, Group value)? updateCategory,
    TResult Function(Category value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (getCategories != null) {
      return getCategories(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getCategoriesEvent value) getCategories,
    required TResult Function(_insertCategoryEvent value) insertCategory,
    required TResult Function(_updateCategoryEvent value) updateCategory,
    required TResult Function(_deleteCategoryEvent value) deleteCategory,
  }) {
    return getCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getCategoriesEvent value)? getCategories,
    TResult? Function(_insertCategoryEvent value)? insertCategory,
    TResult? Function(_updateCategoryEvent value)? updateCategory,
    TResult? Function(_deleteCategoryEvent value)? deleteCategory,
  }) {
    return getCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getCategoriesEvent value)? getCategories,
    TResult Function(_insertCategoryEvent value)? insertCategory,
    TResult Function(_updateCategoryEvent value)? updateCategory,
    TResult Function(_deleteCategoryEvent value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (getCategories != null) {
      return getCategories(this);
    }
    return orElse();
  }
}

abstract class _getCategoriesEvent implements CategoriesBlocEvent {
  const factory _getCategoriesEvent({required final int page}) =
      _$_getCategoriesEvent;

  int get page;
  @JsonKey(ignore: true)
  _$$_getCategoriesEventCopyWith<_$_getCategoriesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_insertCategoryEventCopyWith<$Res> {
  factory _$$_insertCategoryEventCopyWith(_$_insertCategoryEvent value,
          $Res Function(_$_insertCategoryEvent) then) =
      __$$_insertCategoryEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Category value});
}

/// @nodoc
class __$$_insertCategoryEventCopyWithImpl<$Res>
    extends _$CategoriesBlocEventCopyWithImpl<$Res, _$_insertCategoryEvent>
    implements _$$_insertCategoryEventCopyWith<$Res> {
  __$$_insertCategoryEventCopyWithImpl(_$_insertCategoryEvent _value,
      $Res Function(_$_insertCategoryEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_insertCategoryEvent(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_insertCategoryEvent implements _insertCategoryEvent {
  const _$_insertCategoryEvent({required this.value});

  @override
  final Category value;

  @override
  String toString() {
    return 'CategoriesBlocEvent.insertCategory(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_insertCategoryEvent &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_insertCategoryEventCopyWith<_$_insertCategoryEvent> get copyWith =>
      __$$_insertCategoryEventCopyWithImpl<_$_insertCategoryEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getCategories,
    required TResult Function(Category value) insertCategory,
    required TResult Function(Category oldValue, Group value) updateCategory,
    required TResult Function(Category value) deleteCategory,
  }) {
    return insertCategory(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getCategories,
    TResult? Function(Category value)? insertCategory,
    TResult? Function(Category oldValue, Group value)? updateCategory,
    TResult? Function(Category value)? deleteCategory,
  }) {
    return insertCategory?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getCategories,
    TResult Function(Category value)? insertCategory,
    TResult Function(Category oldValue, Group value)? updateCategory,
    TResult Function(Category value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (insertCategory != null) {
      return insertCategory(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getCategoriesEvent value) getCategories,
    required TResult Function(_insertCategoryEvent value) insertCategory,
    required TResult Function(_updateCategoryEvent value) updateCategory,
    required TResult Function(_deleteCategoryEvent value) deleteCategory,
  }) {
    return insertCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getCategoriesEvent value)? getCategories,
    TResult? Function(_insertCategoryEvent value)? insertCategory,
    TResult? Function(_updateCategoryEvent value)? updateCategory,
    TResult? Function(_deleteCategoryEvent value)? deleteCategory,
  }) {
    return insertCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getCategoriesEvent value)? getCategories,
    TResult Function(_insertCategoryEvent value)? insertCategory,
    TResult Function(_updateCategoryEvent value)? updateCategory,
    TResult Function(_deleteCategoryEvent value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (insertCategory != null) {
      return insertCategory(this);
    }
    return orElse();
  }
}

abstract class _insertCategoryEvent implements CategoriesBlocEvent {
  const factory _insertCategoryEvent({required final Category value}) =
      _$_insertCategoryEvent;

  Category get value;
  @JsonKey(ignore: true)
  _$$_insertCategoryEventCopyWith<_$_insertCategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateCategoryEventCopyWith<$Res> {
  factory _$$_updateCategoryEventCopyWith(_$_updateCategoryEvent value,
          $Res Function(_$_updateCategoryEvent) then) =
      __$$_updateCategoryEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Category oldValue, Group value});
}

/// @nodoc
class __$$_updateCategoryEventCopyWithImpl<$Res>
    extends _$CategoriesBlocEventCopyWithImpl<$Res, _$_updateCategoryEvent>
    implements _$$_updateCategoryEventCopyWith<$Res> {
  __$$_updateCategoryEventCopyWithImpl(_$_updateCategoryEvent _value,
      $Res Function(_$_updateCategoryEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldValue = null,
    Object? value = null,
  }) {
    return _then(_$_updateCategoryEvent(
      oldValue: null == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as Category,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Group,
    ));
  }
}

/// @nodoc

class _$_updateCategoryEvent implements _updateCategoryEvent {
  const _$_updateCategoryEvent({required this.oldValue, required this.value});

  @override
  final Category oldValue;
  @override
  final Group value;

  @override
  String toString() {
    return 'CategoriesBlocEvent.updateCategory(oldValue: $oldValue, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateCategoryEvent &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldValue, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_updateCategoryEventCopyWith<_$_updateCategoryEvent> get copyWith =>
      __$$_updateCategoryEventCopyWithImpl<_$_updateCategoryEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getCategories,
    required TResult Function(Category value) insertCategory,
    required TResult Function(Category oldValue, Group value) updateCategory,
    required TResult Function(Category value) deleteCategory,
  }) {
    return updateCategory(oldValue, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getCategories,
    TResult? Function(Category value)? insertCategory,
    TResult? Function(Category oldValue, Group value)? updateCategory,
    TResult? Function(Category value)? deleteCategory,
  }) {
    return updateCategory?.call(oldValue, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getCategories,
    TResult Function(Category value)? insertCategory,
    TResult Function(Category oldValue, Group value)? updateCategory,
    TResult Function(Category value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (updateCategory != null) {
      return updateCategory(oldValue, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getCategoriesEvent value) getCategories,
    required TResult Function(_insertCategoryEvent value) insertCategory,
    required TResult Function(_updateCategoryEvent value) updateCategory,
    required TResult Function(_deleteCategoryEvent value) deleteCategory,
  }) {
    return updateCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getCategoriesEvent value)? getCategories,
    TResult? Function(_insertCategoryEvent value)? insertCategory,
    TResult? Function(_updateCategoryEvent value)? updateCategory,
    TResult? Function(_deleteCategoryEvent value)? deleteCategory,
  }) {
    return updateCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getCategoriesEvent value)? getCategories,
    TResult Function(_insertCategoryEvent value)? insertCategory,
    TResult Function(_updateCategoryEvent value)? updateCategory,
    TResult Function(_deleteCategoryEvent value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (updateCategory != null) {
      return updateCategory(this);
    }
    return orElse();
  }
}

abstract class _updateCategoryEvent implements CategoriesBlocEvent {
  const factory _updateCategoryEvent(
      {required final Category oldValue,
      required final Group value}) = _$_updateCategoryEvent;

  Category get oldValue;
  Group get value;
  @JsonKey(ignore: true)
  _$$_updateCategoryEventCopyWith<_$_updateCategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_deleteCategoryEventCopyWith<$Res> {
  factory _$$_deleteCategoryEventCopyWith(_$_deleteCategoryEvent value,
          $Res Function(_$_deleteCategoryEvent) then) =
      __$$_deleteCategoryEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Category value});
}

/// @nodoc
class __$$_deleteCategoryEventCopyWithImpl<$Res>
    extends _$CategoriesBlocEventCopyWithImpl<$Res, _$_deleteCategoryEvent>
    implements _$$_deleteCategoryEventCopyWith<$Res> {
  __$$_deleteCategoryEventCopyWithImpl(_$_deleteCategoryEvent _value,
      $Res Function(_$_deleteCategoryEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_deleteCategoryEvent(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_deleteCategoryEvent implements _deleteCategoryEvent {
  const _$_deleteCategoryEvent({required this.value});

  @override
  final Category value;

  @override
  String toString() {
    return 'CategoriesBlocEvent.deleteCategory(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_deleteCategoryEvent &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_deleteCategoryEventCopyWith<_$_deleteCategoryEvent> get copyWith =>
      __$$_deleteCategoryEventCopyWithImpl<_$_deleteCategoryEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getCategories,
    required TResult Function(Category value) insertCategory,
    required TResult Function(Category oldValue, Group value) updateCategory,
    required TResult Function(Category value) deleteCategory,
  }) {
    return deleteCategory(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getCategories,
    TResult? Function(Category value)? insertCategory,
    TResult? Function(Category oldValue, Group value)? updateCategory,
    TResult? Function(Category value)? deleteCategory,
  }) {
    return deleteCategory?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getCategories,
    TResult Function(Category value)? insertCategory,
    TResult Function(Category oldValue, Group value)? updateCategory,
    TResult Function(Category value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (deleteCategory != null) {
      return deleteCategory(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getCategoriesEvent value) getCategories,
    required TResult Function(_insertCategoryEvent value) insertCategory,
    required TResult Function(_updateCategoryEvent value) updateCategory,
    required TResult Function(_deleteCategoryEvent value) deleteCategory,
  }) {
    return deleteCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getCategoriesEvent value)? getCategories,
    TResult? Function(_insertCategoryEvent value)? insertCategory,
    TResult? Function(_updateCategoryEvent value)? updateCategory,
    TResult? Function(_deleteCategoryEvent value)? deleteCategory,
  }) {
    return deleteCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getCategoriesEvent value)? getCategories,
    TResult Function(_insertCategoryEvent value)? insertCategory,
    TResult Function(_updateCategoryEvent value)? updateCategory,
    TResult Function(_deleteCategoryEvent value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (deleteCategory != null) {
      return deleteCategory(this);
    }
    return orElse();
  }
}

abstract class _deleteCategoryEvent implements CategoriesBlocEvent {
  const factory _deleteCategoryEvent({required final Category value}) =
      _$_deleteCategoryEvent;

  Category get value;
  @JsonKey(ignore: true)
  _$$_deleteCategoryEventCopyWith<_$_deleteCategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
