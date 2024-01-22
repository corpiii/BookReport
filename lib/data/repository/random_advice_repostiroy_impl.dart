import 'dart:convert';

import 'package:book_report/domain/repository/random_advice_repository.dart';
import 'package:http/http.dart' as http;

class RandomAdviceRepositoryImpl implements RandomAdviceRepository {
  final _baseUrl = 'https://api.adviceslip.com/advice';

  @override
  Future<String> fetchRandomAdvice() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (200 <= response.statusCode && response.statusCode <= 300) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      final advice = result['slip']['advice'] as String;
      
      return advice;
    } else {
      return 'error';
    }
  }
}