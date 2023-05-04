import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';

// Ссылка на будущий сгенерированный файл
part 'ArticleResponse.freezed.dart';
// Файл, в котором будет реализация де/сериализации объекта
part 'ArticleResponse.g.dart';

// Новость
@freezed
class ArticleResponse with _$ArticleResponse {
  // Конструктор с полями, которые будут храниться в миксине _$ArticleResponse
  const factory ArticleResponse({required String title, required String summary}) = _ArticleResponse;

  factory ArticleResponse.fromJson(Map<String, Object?> json) => _$ArticleResponseFromJson(json);
}

//Список новостей
class ArticleListResponse {
  List<ArticleResponse> list = [];

  ArticleListResponse({required this.list});

  // Конструктор для обработки спика JSON
  ArticleListResponse.fromJson(List<dynamic> json) {
    for (var element in json) {
      try {
        if(element is Map<String, dynamic>) {
          list.add(ArticleResponse.fromJson(element));
        }
      } catch(e) {
        log(e.toString());
      }
    }
  }
}