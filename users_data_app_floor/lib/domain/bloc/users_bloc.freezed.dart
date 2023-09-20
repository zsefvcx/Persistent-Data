// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsersBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UsersModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UsersModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UsersModelData model)? loaded,
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
abstract class $UsersBlocStateCopyWith<$Res> {
  factory $UsersBlocStateCopyWith(
          UsersBlocState value, $Res Function(UsersBlocState) then) =
      _$UsersBlocStateCopyWithImpl<$Res, UsersBlocState>;
}

/// @nodoc
class _$UsersBlocStateCopyWithImpl<$Res, $Val extends UsersBlocState>
    implements $UsersBlocStateCopyWith<$Res> {
  _$UsersBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$UsersBlocStateCopyWithImpl<$Res, _$_loadingState>
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
    return 'UsersBlocState.loading()';
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
    required TResult Function(UsersModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UsersModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UsersModelData model)? loaded,
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

abstract class _loadingState implements UsersBlocState {
  const factory _loadingState() = _$_loadingState;
}

/// @nodoc
abstract class _$$_loadedStateCopyWith<$Res> {
  factory _$$_loadedStateCopyWith(
          _$_loadedState value, $Res Function(_$_loadedState) then) =
      __$$_loadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UsersModelData model});
}

/// @nodoc
class __$$_loadedStateCopyWithImpl<$Res>
    extends _$UsersBlocStateCopyWithImpl<$Res, _$_loadedState>
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
              as UsersModelData,
    ));
  }
}

/// @nodoc

class _$_loadedState implements _loadedState {
  const _$_loadedState({required this.model});

  @override
  final UsersModelData model;

  @override
  String toString() {
    return 'UsersBlocState.loaded(model: $model)';
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
    required TResult Function(UsersModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loaded(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UsersModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loaded?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UsersModelData model)? loaded,
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

abstract class _loadedState implements UsersBlocState {
  const factory _loadedState({required final UsersModelData model}) =
      _$_loadedState;

  UsersModelData get model;
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
    extends _$UsersBlocStateCopyWithImpl<$Res, _$_errorState>
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
    return 'UsersBlocState.error()';
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
    required TResult Function(UsersModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UsersModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UsersModelData model)? loaded,
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

abstract class _errorState implements UsersBlocState {
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
    extends _$UsersBlocStateCopyWithImpl<$Res, _$_timeOut>
    implements _$$_timeOutCopyWith<$Res> {
  __$$_timeOutCopyWithImpl(_$_timeOut _value, $Res Function(_$_timeOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_timeOut implements _timeOut {
  const _$_timeOut();

  @override
  String toString() {
    return 'UsersBlocState.timeOut()';
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
    required TResult Function(UsersModelData model) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UsersModelData model)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UsersModelData model)? loaded,
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

abstract class _timeOut implements UsersBlocState {
  const factory _timeOut() = _$_timeOut;
}

/// @nodoc
mixin _$UsersBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) get,
    required TResult Function(User value) insert,
    required TResult Function(User oldValue, User value) update,
    required TResult Function(User value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? get,
    TResult? Function(User value)? insert,
    TResult? Function(User oldValue, User value)? update,
    TResult? Function(User value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? get,
    TResult Function(User value)? insert,
    TResult Function(User oldValue, User value)? update,
    TResult Function(User value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) get,
    required TResult Function(_insertEvent value) insert,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_deleteEvent value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? get,
    TResult? Function(_insertEvent value)? insert,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_deleteEvent value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? get,
    TResult Function(_insertEvent value)? insert,
    TResult Function(_updateEvent value)? update,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersBlocEventCopyWith<$Res> {
  factory $UsersBlocEventCopyWith(
          UsersBlocEvent value, $Res Function(UsersBlocEvent) then) =
      _$UsersBlocEventCopyWithImpl<$Res, UsersBlocEvent>;
}

/// @nodoc
class _$UsersBlocEventCopyWithImpl<$Res, $Val extends UsersBlocEvent>
    implements $UsersBlocEventCopyWith<$Res> {
  _$UsersBlocEventCopyWithImpl(this._value, this._then);

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
    extends _$UsersBlocEventCopyWithImpl<$Res, _$_initEvent>
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
    return 'UsersBlocEvent.init()';
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
    required TResult Function(int page) get,
    required TResult Function(User value) insert,
    required TResult Function(User oldValue, User value) update,
    required TResult Function(User value) delete,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? get,
    TResult? Function(User value)? insert,
    TResult? Function(User oldValue, User value)? update,
    TResult? Function(User value)? delete,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? get,
    TResult Function(User value)? insert,
    TResult Function(User oldValue, User value)? update,
    TResult Function(User value)? delete,
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
    required TResult Function(_getEvent value) get,
    required TResult Function(_insertEvent value) insert,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? get,
    TResult? Function(_insertEvent value)? insert,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? get,
    TResult Function(_insertEvent value)? insert,
    TResult Function(_updateEvent value)? update,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements UsersBlocEvent {
  const factory _initEvent() = _$_initEvent;
}

/// @nodoc
abstract class _$$_getEventCopyWith<$Res> {
  factory _$$_getEventCopyWith(
          _$_getEvent value, $Res Function(_$_getEvent) then) =
      __$$_getEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_getEventCopyWithImpl<$Res>
    extends _$UsersBlocEventCopyWithImpl<$Res, _$_getEvent>
    implements _$$_getEventCopyWith<$Res> {
  __$$_getEventCopyWithImpl(
      _$_getEvent _value, $Res Function(_$_getEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_getEvent(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_getEvent implements _getEvent {
  const _$_getEvent({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'UsersBlocEvent.get(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getEvent &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_getEventCopyWith<_$_getEvent> get copyWith =>
      __$$_getEventCopyWithImpl<_$_getEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) get,
    required TResult Function(User value) insert,
    required TResult Function(User oldValue, User value) update,
    required TResult Function(User value) delete,
  }) {
    return get(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? get,
    TResult? Function(User value)? insert,
    TResult? Function(User oldValue, User value)? update,
    TResult? Function(User value)? delete,
  }) {
    return get?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? get,
    TResult Function(User value)? insert,
    TResult Function(User oldValue, User value)? update,
    TResult Function(User value)? delete,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) get,
    required TResult Function(_insertEvent value) insert,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? get,
    TResult? Function(_insertEvent value)? insert,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? get,
    TResult Function(_insertEvent value)? insert,
    TResult Function(_updateEvent value)? update,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _getEvent implements UsersBlocEvent {
  const factory _getEvent({required final int page}) = _$_getEvent;

  int get page;
  @JsonKey(ignore: true)
  _$$_getEventCopyWith<_$_getEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_insertEventCopyWith<$Res> {
  factory _$$_insertEventCopyWith(
          _$_insertEvent value, $Res Function(_$_insertEvent) then) =
      __$$_insertEventCopyWithImpl<$Res>;
  @useResult
  $Res call({User value});
}

/// @nodoc
class __$$_insertEventCopyWithImpl<$Res>
    extends _$UsersBlocEventCopyWithImpl<$Res, _$_insertEvent>
    implements _$$_insertEventCopyWith<$Res> {
  __$$_insertEventCopyWithImpl(
      _$_insertEvent _value, $Res Function(_$_insertEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_insertEvent(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_insertEvent implements _insertEvent {
  const _$_insertEvent({required this.value});

  @override
  final User value;

  @override
  String toString() {
    return 'UsersBlocEvent.insert(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_insertEvent &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_insertEventCopyWith<_$_insertEvent> get copyWith =>
      __$$_insertEventCopyWithImpl<_$_insertEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) get,
    required TResult Function(User value) insert,
    required TResult Function(User oldValue, User value) update,
    required TResult Function(User value) delete,
  }) {
    return insert(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? get,
    TResult? Function(User value)? insert,
    TResult? Function(User oldValue, User value)? update,
    TResult? Function(User value)? delete,
  }) {
    return insert?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? get,
    TResult Function(User value)? insert,
    TResult Function(User oldValue, User value)? update,
    TResult Function(User value)? delete,
    required TResult orElse(),
  }) {
    if (insert != null) {
      return insert(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) get,
    required TResult Function(_insertEvent value) insert,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return insert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? get,
    TResult? Function(_insertEvent value)? insert,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return insert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? get,
    TResult Function(_insertEvent value)? insert,
    TResult Function(_updateEvent value)? update,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (insert != null) {
      return insert(this);
    }
    return orElse();
  }
}

abstract class _insertEvent implements UsersBlocEvent {
  const factory _insertEvent({required final User value}) = _$_insertEvent;

  User get value;
  @JsonKey(ignore: true)
  _$$_insertEventCopyWith<_$_insertEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateEventCopyWith<$Res> {
  factory _$$_updateEventCopyWith(
          _$_updateEvent value, $Res Function(_$_updateEvent) then) =
      __$$_updateEventCopyWithImpl<$Res>;
  @useResult
  $Res call({User oldValue, User value});
}

/// @nodoc
class __$$_updateEventCopyWithImpl<$Res>
    extends _$UsersBlocEventCopyWithImpl<$Res, _$_updateEvent>
    implements _$$_updateEventCopyWith<$Res> {
  __$$_updateEventCopyWithImpl(
      _$_updateEvent _value, $Res Function(_$_updateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldValue = null,
    Object? value = null,
  }) {
    return _then(_$_updateEvent(
      oldValue: null == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as User,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_updateEvent implements _updateEvent {
  const _$_updateEvent({required this.oldValue, required this.value});

  @override
  final User oldValue;
  @override
  final User value;

  @override
  String toString() {
    return 'UsersBlocEvent.update(oldValue: $oldValue, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateEvent &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldValue, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_updateEventCopyWith<_$_updateEvent> get copyWith =>
      __$$_updateEventCopyWithImpl<_$_updateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) get,
    required TResult Function(User value) insert,
    required TResult Function(User oldValue, User value) update,
    required TResult Function(User value) delete,
  }) {
    return update(oldValue, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? get,
    TResult? Function(User value)? insert,
    TResult? Function(User oldValue, User value)? update,
    TResult? Function(User value)? delete,
  }) {
    return update?.call(oldValue, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? get,
    TResult Function(User value)? insert,
    TResult Function(User oldValue, User value)? update,
    TResult Function(User value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(oldValue, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) get,
    required TResult Function(_insertEvent value) insert,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? get,
    TResult? Function(_insertEvent value)? insert,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? get,
    TResult Function(_insertEvent value)? insert,
    TResult Function(_updateEvent value)? update,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _updateEvent implements UsersBlocEvent {
  const factory _updateEvent(
      {required final User oldValue,
      required final User value}) = _$_updateEvent;

  User get oldValue;
  User get value;
  @JsonKey(ignore: true)
  _$$_updateEventCopyWith<_$_updateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_deleteEventCopyWith<$Res> {
  factory _$$_deleteEventCopyWith(
          _$_deleteEvent value, $Res Function(_$_deleteEvent) then) =
      __$$_deleteEventCopyWithImpl<$Res>;
  @useResult
  $Res call({User value});
}

/// @nodoc
class __$$_deleteEventCopyWithImpl<$Res>
    extends _$UsersBlocEventCopyWithImpl<$Res, _$_deleteEvent>
    implements _$$_deleteEventCopyWith<$Res> {
  __$$_deleteEventCopyWithImpl(
      _$_deleteEvent _value, $Res Function(_$_deleteEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_deleteEvent(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_deleteEvent implements _deleteEvent {
  const _$_deleteEvent({required this.value});

  @override
  final User value;

  @override
  String toString() {
    return 'UsersBlocEvent.delete(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_deleteEvent &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_deleteEventCopyWith<_$_deleteEvent> get copyWith =>
      __$$_deleteEventCopyWithImpl<_$_deleteEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(int page) get,
    required TResult Function(User value) insert,
    required TResult Function(User oldValue, User value) update,
    required TResult Function(User value) delete,
  }) {
    return delete(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(int page)? get,
    TResult? Function(User value)? insert,
    TResult? Function(User oldValue, User value)? update,
    TResult? Function(User value)? delete,
  }) {
    return delete?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(int page)? get,
    TResult Function(User value)? insert,
    TResult Function(User oldValue, User value)? update,
    TResult Function(User value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_getEvent value) get,
    required TResult Function(_insertEvent value) insert,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_getEvent value)? get,
    TResult? Function(_insertEvent value)? insert,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_getEvent value)? get,
    TResult Function(_insertEvent value)? insert,
    TResult Function(_updateEvent value)? update,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _deleteEvent implements UsersBlocEvent {
  const factory _deleteEvent({required final User value}) = _$_deleteEvent;

  User get value;
  @JsonKey(ignore: true)
  _$$_deleteEventCopyWith<_$_deleteEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
