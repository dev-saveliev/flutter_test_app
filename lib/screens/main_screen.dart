import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.notes,
      size: 150,
    ),
    Icon(
      Icons.people,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  final selectedItemProvider = StateProvider<int>((ref) {
    return 0;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemIndex = ref.watch(selectedItemProvider);

    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildBottomNavigationBar(ref),
      body: Center(
        child: _pages.elementAt(itemIndex), //New
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Main'),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(WidgetRef ref) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.notes),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Users',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
      ],
      onTap: (index) => _onItemTapped(index, ref),
    );
  }

  _onItemTapped(int index, WidgetRef ref) {
    ref.read(selectedItemProvider.notifier).state = index;
  }
}
