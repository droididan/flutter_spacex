// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_states.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class MissionState extends Equatable {
  const MissionState(this._type);

  factory MissionState.empty() = Empty;

  factory MissionState.loading() = Loading;

  factory MissionState.loaded({@required MissionResponse model}) = Loaded;

  factory MissionState.error({@required String message}) = Error;

  final _MissionState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Empty) empty,
      @required R Function(Loading) loading,
      @required R Function(Loaded) loaded,
      @required R Function(Error) error}) {
    switch (this._type) {
      case _MissionState.Empty:
        return empty(this as Empty);
      case _MissionState.Loading:
        return loading(this as Loading);
      case _MissionState.Loaded:
        return loaded(this as Loaded);
      case _MissionState.Error:
        return error(this as Error);
    }
  }

  @override
  List get props => null;
}

@immutable
class Empty extends MissionState {
  const Empty._() : super(_MissionState.Empty);

  factory Empty() {
    _instance ??= Empty._();
    return _instance;
  }

  static Empty _instance;
}

@immutable
class Loading extends MissionState {
  const Loading._() : super(_MissionState.Loading);

  factory Loading() {
    _instance ??= Loading._();
    return _instance;
  }

  static Loading _instance;
}

@immutable
class Loaded extends MissionState {
  const Loaded({@required this.model}) : super(_MissionState.Loaded);

  final MissionResponse model;

  @override
  String toString() => 'Loaded(model:${this.model})';
  @override
  List get props => [model];
}

@immutable
class Error extends MissionState {
  const Error({@required this.message}) : super(_MissionState.Error);

  final String message;

  @override
  String toString() => 'Error(message:${this.message})';
  @override
  List get props => [message];
}
