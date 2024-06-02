import 'package:flutter/material.dart';
import 'package:flutter_test_app/api/model/news_model.dart';
import 'package:flutter_test_app/api/requests/news_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsScreen extends ConsumerWidget {
  NewsScreen({super.key});

  final newsProvider = FutureProvider.autoDispose<List<NewsModel>>((ref) {
    return NewsRequest().run();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsProvider);

    return newsAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (news) => _buildList(news), // Text(news.length.toString()),
    );
  }

  _buildList(List<NewsModel> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('News  # $index'),
        );
      },
    );
  }
}
