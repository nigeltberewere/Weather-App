import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
sealed class AppError with _$AppError {
  const factory AppError.network(String message) = NetworkError;
  const factory AppError.server(String message) = ServerError;
  const factory AppError.location(String message) = LocationError;
  const factory AppError.permission(String message) = PermissionError;
  const factory AppError.cache(String message) = CacheError;
  const factory AppError.unknown(String message) = UnknownError;
}
