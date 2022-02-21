import 'dart:convert';
import 'package:http/http.dart' as http;

class Quote {
  late final String quote, author;
  Quote({required this.quote, required this.author});
  factory Quote.fromJson(Map<String, dynamic> json) {
    String quote = json['content'];
    print(quote);
    String author = json['author'];
    print(author);
    return Quote(quote: quote, author: author);
  }
}

Future<Quote> fetchquo() async {
  final response = await http.get(Uri.parse("http://api.quotable.io/random"));
  final data = jsonDecode(response.body);
  return Quote.fromJson(data);
}
