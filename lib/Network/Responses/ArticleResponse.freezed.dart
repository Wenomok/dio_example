// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ArticleResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return _ArticleResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticleResponse {
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleResponseCopyWith<ArticleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleResponseCopyWith<$Res> {
  factory $ArticleResponseCopyWith(
          ArticleResponse value, $Res Function(ArticleResponse) then) =
      _$ArticleResponseCopyWithImpl<$Res, ArticleResponse>;
  @useResult
  $Res call({String title, String summary});
}

/// @nodoc
class _$ArticleResponseCopyWithImpl<$Res, $Val extends ArticleResponse>
    implements $ArticleResponseCopyWith<$Res> {
  _$ArticleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleResponseCopyWith<$Res>
    implements $ArticleResponseCopyWith<$Res> {
  factory _$$_ArticleResponseCopyWith(
          _$_ArticleResponse value, $Res Function(_$_ArticleResponse) then) =
      __$$_ArticleResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String summary});
}

/// @nodoc
class __$$_ArticleResponseCopyWithImpl<$Res>
    extends _$ArticleResponseCopyWithImpl<$Res, _$_ArticleResponse>
    implements _$$_ArticleResponseCopyWith<$Res> {
  __$$_ArticleResponseCopyWithImpl(
      _$_ArticleResponse _value, $Res Function(_$_ArticleResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? summary = null,
  }) {
    return _then(_$_ArticleResponse(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticleResponse implements _ArticleResponse {
  const _$_ArticleResponse({required this.title, required this.summary});

  factory _$_ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleResponseFromJson(json);

  @override
  final String title;
  @override
  final String summary;

  @override
  String toString() {
    return 'ArticleResponse(title: $title, summary: $summary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleResponse &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleResponseCopyWith<_$_ArticleResponse> get copyWith =>
      __$$_ArticleResponseCopyWithImpl<_$_ArticleResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleResponseToJson(
      this,
    );
  }
}

abstract class _ArticleResponse implements ArticleResponse {
  const factory _ArticleResponse(
      {required final String title,
      required final String summary}) = _$_ArticleResponse;

  factory _ArticleResponse.fromJson(Map<String, dynamic> json) =
      _$_ArticleResponse.fromJson;

  @override
  String get title;
  @override
  String get summary;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleResponseCopyWith<_$_ArticleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
