import 'package:flutter/material.dart';

class StickyHeaderList extends StatefulWidget {
  const StickyHeaderList({super.key});

  @override
  StickyHeaderListState createState() => StickyHeaderListState();
}

class StickyHeaderListState extends State<StickyHeaderList> {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  final List<String> headers = ['Header 1', 'Header 2', 'Header 3'];
  final Map<int, List<bool>> checkedItems = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < headers.length; i++) {
      checkedItems[i] = List<bool>.filled(items.length, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        for (int i = 0; i < headers.length; i++) ...[
          SliverMainAxisGroup(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(headers[i]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: checkedItems[i]?[index] ?? false,
                          onChanged: (bool? value) {
                            setState(() {
                              checkedItems[i]?[index] = value ?? false;
                            });
                          },
                        ),
                        title: Text(items[index]),
                      ),
                    );
                  },
                  childCount: items.length,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _StickyHeaderDelegate(this.title);

  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.purple[100],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
