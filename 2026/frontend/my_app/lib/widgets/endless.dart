import 'package:flutter/material.dart';
class InfiniteScrollPage extends StatefulWidget {
  const InfiniteScrollPage({super.key});

  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = List.generate(20, (index) => "Item ${index + 1}");
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !isLoading) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    setState(() => isLoading = true);

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    final nextItems =
        List.generate(10, (index) => "Item ${items.length + index + 1}");
    setState(() {
      items.addAll(nextItems);
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Infinite Scroll")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + 1, // extra for loading indicator
        itemBuilder: (context, index) {
          if (index < items.length) {
            return ListTile(title: Text(items[index]));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: isLoading
                    ? CircularProgressIndicator()
                    : SizedBox.shrink(),
              ),
            );
          }
        },
      ),
    );
  }
}

