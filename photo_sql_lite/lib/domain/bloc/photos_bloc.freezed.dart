// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photos_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GroupsBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(PhotosModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosModelData model)? loaded,
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
abstract class $GroupsBlocStateCopyWith<$Res> {
  factory $GroupsBlocStateCopyWith(
          PhotosBlocState value, $Res Function(PhotosBlocState) then) =
      _$GroupsBlocStateCopyWithImpl<$Res, PhotosBlocState>;
}

/// @nodoc
class _$GroupsBlocStateCopyWithImpl<$Res, $Val extends PhotosBlocState>
    implements $GroupsBlocStateCopyWith<$Res> {
  _$GroupsBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$GroupsBlocStateCopyWithImpl<$Res, _$_loadingState>
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
    return 'GroupsBlocState.loading()';
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
    required TResult Function(PhotosModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosModelData model)? loaded,
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

abstract class _loadingState implements PhotosBlocState {
  const factory _loadingState() = _$_loadingState;
}

/// @nodoc
abstract class _$$_loadedStateCopyWith<$Res> {
  factory _$$_loadedStateCopyWith(
          _$_loadedState value, $Res Function(_$_loadedState) then) =
      __$$_loadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({PhotosModelData model});
}

/// @nodoc
class __$$_loadedStateCopyWithImpl<$Res>
    extends _$GroupsBlocStateCopyWithImpl<$Res, _$_loadedState>
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
              as PhotosModelData,
    ));
  }
}

/// @nodoc

class _$_loadedState implements _loadedState {
  const _$_loadedState({required this.model});

  @override
  final PhotosModelData model;

  @override
  String toString() {
    return 'GroupsBlocState.loaded(model: $model)';
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
    required TResult Function(PhotosModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loaded(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loaded?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosModelData model)? loaded,
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

abstract class _loadedState implements PhotosBlocState {
  const factory _loadedState({required final PhotosModelData model}) =
      _$_loadedState;

  PhotosModelData get model;
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
    extends _$GroupsBlocStateCopyWithImpl<$Res, _$_errorState>
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
    return 'GroupsBlocState.error()';
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
    required TResult Function(PhotosModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosModelData model)? loaded,
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

abstract class _errorState implements PhotosBlocState {
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
    extends _$GroupsBlocStateCopyWithImpl<$Res, _$_timeOut>
    implements _$$_timeOutCopyWith<$Res> {
  __$$_timeOutCopyWithImpl(_$_timeOut _value, $Res Function(_$_timeOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_timeOut implements _timeOut {
  const _$_timeOut();

  @override
  String toString() {
    return 'GroupsBlocState.timeOut()';
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
    required TResult Function(PhotosModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosModelData model)? loaded,
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

abstract class _timeOut implements PhotosBlocState {
  const factory _timeOut() = _$_timeOut;
}

/// @nodoc
mixin _$GroupsBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getGroups,
    required TResult Function(Photo value) insertGroup,
    required TResult Function(Photo oldValue, Photo value) updateGroup,
    required TResult Function(Photo value) deleteGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getGroups,
    TResult? Function(Photo value)? insertGroup,
    TResult? Function(Photo oldValue, Photo value)? updateGroup,
    TResult? Function(Photo value)? deleteGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getGroups,
    TResult Function(Photo value)? insertGroup,
    TResult Function(Photo oldValue, Photo value)? updateGroup,
    TResult Function(Photo value)? deleteGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) getGroups,
    required TResult Function(_insertEvent value) insertGroup,
    required TResult Function(_updateEvent value) updateGroup,
    required TResult Function(_deleteEvent value) deleteGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? getGroups,
    TResult? Function(_insertEvent value)? insertGroup,
    TResult? Function(_updateEvent value)? updateGroup,
    TResult? Function(_deleteEvent value)? deleteGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? getGroups,
    TResult Function(_insertEvent value)? insertGroup,
    TResult Function(_updateEvent value)? updateGroup,
    TResult Function(_deleteEvent value)? deleteGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupsBlocEventCopyWith<$Res> {
  factory $GroupsBlocEventCopyWith(
          PhotosBlocEvent value, $Res Function(PhotosBlocEvent) then) =
      _$GroupsBlocEventCopyWithImpl<$Res, PhotosBlocEvent>;
}

/// @nodoc
class _$GroupsBlocEventCopyWithImpl<$Res, $Val extends PhotosBlocEvent>
    implements $GroupsBlocEventCopyWith<$Res> {
  _$GroupsBlocEventCopyWithImpl(this._value, this._then);

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
    extends _$GroupsBlocEventCopyWithImpl<$Res, _$_initEvent>
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
    return 'GroupsBlocEvent.init()';
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
    required TResult Function(int page) getGroups,
    required TResult Function(Photo value) insertGroup,
    required TResult Function(Photo oldValue, Photo value) updateGroup,
    required TResult Function(Photo value) deleteGroup,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getGroups,
    TResult? Function(Photo value)? insertGroup,
    TResult? Function(Photo oldValue, Photo value)? updateGroup,
    TResult? Function(Photo value)? deleteGroup,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getGroups,
    TResult Function(Photo value)? insertGroup,
    TResult Function(Photo oldValue, Photo value)? updateGroup,
    TResult Function(Photo value)? deleteGroup,
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
    required TResult Function(_getEvent value) getGroups,
    required TResult Function(_insertEvent value) insertGroup,
    required TResult Function(_updateEvent value) updateGroup,
    required TResult Function(_deleteEvent value) deleteGroup,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? getGroups,
    TResult? Function(_insertEvent value)? insertGroup,
    TResult? Function(_updateEvent value)? updateGroup,
    TResult? Function(_deleteEvent value)? deleteGroup,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? getGroups,
    TResult Function(_insertEvent value)? insertGroup,
    TResult Function(_updateEvent value)? updateGroup,
    TResult Function(_deleteEvent value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements PhotosBlocEvent {
  const factory _initEvent() = _$_initEvent;
}

/// @nodoc
abstract class _$$_getGroupsEventCopyWith<$Res> {
  factory _$$_getGroupsEventCopyWith(
          _$_getGroupsEvent value, $Res Function(_$_getGroupsEvent) then) =
      __$$_getGroupsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_getGroupsEventCopyWithImpl<$Res>
    extends _$GroupsBlocEventCopyWithImpl<$Res, _$_getGroupsEvent>
    implements _$$_getGroupsEventCopyWith<$Res> {
  __$$_getGroupsEventCopyWithImpl(
      _$_getGroupsEvent _value, $Res Function(_$_getGroupsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_getGroupsEvent(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_getGroupsEvent implements _getEvent {
  const _$_getGroupsEvent({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'GroupsBlocEvent.getGroups(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getGroupsEvent &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_getGroupsEventCopyWith<_$_getGroupsEvent> get copyWith =>
      __$$_getGroupsEventCopyWithImpl<_$_getGroupsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getGroups,
    required TResult Function(Photo value) insertGroup,
    required TResult Function(Photo oldValue, Photo value) updateGroup,
    required TResult Function(Photo value) deleteGroup,
  }) {
    return getGroups(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getGroups,
    TResult? Function(Photo value)? insertGroup,
    TResult? Function(Photo oldValue, Photo value)? updateGroup,
    TResult? Function(Photo value)? deleteGroup,
  }) {
    return getGroups?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getGroups,
    TResult Function(Photo value)? insertGroup,
    TResult Function(Photo oldValue, Photo value)? updateGroup,
    TResult Function(Photo value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (getGroups != null) {
      return getGroups(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) getGroups,
    required TResult Function(_insertEvent value) insertGroup,
    required TResult Function(_updateEvent value) updateGroup,
    required TResult Function(_deleteEvent value) deleteGroup,
  }) {
    return getGroups(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? getGroups,
    TResult? Function(_insertEvent value)? insertGroup,
    TResult? Function(_updateEvent value)? updateGroup,
    TResult? Function(_deleteEvent value)? deleteGroup,
  }) {
    return getGroups?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? getGroups,
    TResult Function(_insertEvent value)? insertGroup,
    TResult Function(_updateEvent value)? updateGroup,
    TResult Function(_deleteEvent value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (getGroups != null) {
      return getGroups(this);
    }
    return orElse();
  }
}

abstract class _getEvent implements PhotosBlocEvent {
  const factory _getEvent({required final int page}) = _$_getGroupsEvent;

  int get page;
  @JsonKey(ignore: true)
  _$$_getGroupsEventCopyWith<_$_getGroupsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_insertGroupEventCopyWith<$Res> {
  factory _$$_insertGroupEventCopyWith(
          _$_insertGroupEvent value, $Res Function(_$_insertGroupEvent) then) =
      __$$_insertGroupEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Photo value});
}

/// @nodoc
class __$$_insertGroupEventCopyWithImpl<$Res>
    extends _$GroupsBlocEventCopyWithImpl<$Res, _$_insertGroupEvent>
    implements _$$_insertGroupEventCopyWith<$Res> {
  __$$_insertGroupEventCopyWithImpl(
      _$_insertGroupEvent _value, $Res Function(_$_insertGroupEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_insertGroupEvent(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Photo,
    ));
  }
}

/// @nodoc

class _$_insertGroupEvent implements _insertEvent {
  const _$_insertGroupEvent({required this.value});

  @override
  final Photo value;

  @override
  String toString() {
    return 'GroupsBlocEvent.insertGroup(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_insertGroupEvent &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_insertGroupEventCopyWith<_$_insertGroupEvent> get copyWith =>
      __$$_insertGroupEventCopyWithImpl<_$_insertGroupEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getGroups,
    required TResult Function(Photo value) insertGroup,
    required TResult Function(Photo oldValue, Photo value) updateGroup,
    required TResult Function(Photo value) deleteGroup,
  }) {
    return insertGroup(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getGroups,
    TResult? Function(Photo value)? insertGroup,
    TResult? Function(Photo oldValue, Photo value)? updateGroup,
    TResult? Function(Photo value)? deleteGroup,
  }) {
    return insertGroup?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getGroups,
    TResult Function(Photo value)? insertGroup,
    TResult Function(Photo oldValue, Photo value)? updateGroup,
    TResult Function(Photo value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (insertGroup != null) {
      return insertGroup(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) getGroups,
    required TResult Function(_insertEvent value) insertGroup,
    required TResult Function(_updateEvent value) updateGroup,
    required TResult Function(_deleteEvent value) deleteGroup,
  }) {
    return insertGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? getGroups,
    TResult? Function(_insertEvent value)? insertGroup,
    TResult? Function(_updateEvent value)? updateGroup,
    TResult? Function(_deleteEvent value)? deleteGroup,
  }) {
    return insertGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? getGroups,
    TResult Function(_insertEvent value)? insertGroup,
    TResult Function(_updateEvent value)? updateGroup,
    TResult Function(_deleteEvent value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (insertGroup != null) {
      return insertGroup(this);
    }
    return orElse();
  }
}

abstract class _insertEvent implements PhotosBlocEvent {
  const factory _insertEvent({required final Photo value}) =
      _$_insertGroupEvent;

  Photo get value;
  @JsonKey(ignore: true)
  _$$_insertGroupEventCopyWith<_$_insertGroupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateGroupEventCopyWith<$Res> {
  factory _$$_updateGroupEventCopyWith(
          _$_updateGroupEvent value, $Res Function(_$_updateGroupEvent) then) =
      __$$_updateGroupEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Photo oldValue, Photo value});
}

/// @nodoc
class __$$_updateGroupEventCopyWithImpl<$Res>
    extends _$GroupsBlocEventCopyWithImpl<$Res, _$_updateGroupEvent>
    implements _$$_updateGroupEventCopyWith<$Res> {
  __$$_updateGroupEventCopyWithImpl(
      _$_updateGroupEvent _value, $Res Function(_$_updateGroupEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldValue = null,
    Object? value = null,
  }) {
    return _then(_$_updateGroupEvent(
      oldValue: null == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as Photo,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Photo,
    ));
  }
}

/// @nodoc

class _$_updateGroupEvent implements _updateEvent {
  const _$_updateGroupEvent({required this.oldValue, required this.value});

  @override
  final Photo oldValue;
  @override
  final Photo value;

  @override
  String toString() {
    return 'GroupsBlocEvent.updateGroup(oldValue: $oldValue, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateGroupEvent &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldValue, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_updateGroupEventCopyWith<_$_updateGroupEvent> get copyWith =>
      __$$_updateGroupEventCopyWithImpl<_$_updateGroupEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getGroups,
    required TResult Function(Photo value) insertGroup,
    required TResult Function(Photo oldValue, Photo value) updateGroup,
    required TResult Function(Photo value) deleteGroup,
  }) {
    return updateGroup(oldValue, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getGroups,
    TResult? Function(Photo value)? insertGroup,
    TResult? Function(Photo oldValue, Photo value)? updateGroup,
    TResult? Function(Photo value)? deleteGroup,
  }) {
    return updateGroup?.call(oldValue, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getGroups,
    TResult Function(Photo value)? insertGroup,
    TResult Function(Photo oldValue, Photo value)? updateGroup,
    TResult Function(Photo value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (updateGroup != null) {
      return updateGroup(oldValue, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) getGroups,
    required TResult Function(_insertEvent value) insertGroup,
    required TResult Function(_updateEvent value) updateGroup,
    required TResult Function(_deleteEvent value) deleteGroup,
  }) {
    return updateGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? getGroups,
    TResult? Function(_insertEvent value)? insertGroup,
    TResult? Function(_updateEvent value)? updateGroup,
    TResult? Function(_deleteEvent value)? deleteGroup,
  }) {
    return updateGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? getGroups,
    TResult Function(_insertEvent value)? insertGroup,
    TResult Function(_updateEvent value)? updateGroup,
    TResult Function(_deleteEvent value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (updateGroup != null) {
      return updateGroup(this);
    }
    return orElse();
  }
}

abstract class _updateEvent implements PhotosBlocEvent {
  const factory _updateEvent(
      {required final Photo oldValue,
      required final Photo value}) = _$_updateGroupEvent;

  Photo get oldValue;
  Photo get value;
  @JsonKey(ignore: true)
  _$$_updateGroupEventCopyWith<_$_updateGroupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_deleteGroupEventCopyWith<$Res> {
  factory _$$_deleteGroupEventCopyWith(
          _$_deleteGroupEvent value, $Res Function(_$_deleteGroupEvent) then) =
      __$$_deleteGroupEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Photo value});
}

/// @nodoc
class __$$_deleteGroupEventCopyWithImpl<$Res>
    extends _$GroupsBlocEventCopyWithImpl<$Res, _$_deleteGroupEvent>
    implements _$$_deleteGroupEventCopyWith<$Res> {
  __$$_deleteGroupEventCopyWithImpl(
      _$_deleteGroupEvent _value, $Res Function(_$_deleteGroupEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_deleteGroupEvent(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Photo,
    ));
  }
}

/// @nodoc

class _$_deleteGroupEvent implements _deleteEvent {
  const _$_deleteGroupEvent({required this.value});

  @override
  final Photo value;

  @override
  String toString() {
    return 'GroupsBlocEvent.deleteGroup(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_deleteGroupEvent &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_deleteGroupEventCopyWith<_$_deleteGroupEvent> get copyWith =>
      __$$_deleteGroupEventCopyWithImpl<_$_deleteGroupEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) getGroups,
    required TResult Function(Photo value) insertGroup,
    required TResult Function(Photo oldValue, Photo value) updateGroup,
    required TResult Function(Photo value) deleteGroup,
  }) {
    return deleteGroup(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? getGroups,
    TResult? Function(Photo value)? insertGroup,
    TResult? Function(Photo oldValue, Photo value)? updateGroup,
    TResult? Function(Photo value)? deleteGroup,
  }) {
    return deleteGroup?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? getGroups,
    TResult Function(Photo value)? insertGroup,
    TResult Function(Photo oldValue, Photo value)? updateGroup,
    TResult Function(Photo value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (deleteGroup != null) {
      return deleteGroup(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) getGroups,
    required TResult Function(_insertEvent value) insertGroup,
    required TResult Function(_updateEvent value) updateGroup,
    required TResult Function(_deleteEvent value) deleteGroup,
  }) {
    return deleteGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? getGroups,
    TResult? Function(_insertEvent value)? insertGroup,
    TResult? Function(_updateEvent value)? updateGroup,
    TResult? Function(_deleteEvent value)? deleteGroup,
  }) {
    return deleteGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? getGroups,
    TResult Function(_insertEvent value)? insertGroup,
    TResult Function(_updateEvent value)? updateGroup,
    TResult Function(_deleteEvent value)? deleteGroup,
    required TResult orElse(),
  }) {
    if (deleteGroup != null) {
      return deleteGroup(this);
    }
    return orElse();
  }
}

abstract class _deleteEvent implements PhotosBlocEvent {
  const factory _deleteEvent({required final Photo value}) =
      _$_deleteGroupEvent;

  Photo get value;
  @JsonKey(ignore: true)
  _$$_deleteGroupEventCopyWith<_$_deleteGroupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
