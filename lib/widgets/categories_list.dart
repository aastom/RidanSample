import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.pregnant_woman_outlined),
              title: Text('Woman (736)'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Man (536)'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.pregnant_woman_outlined),
              title: Text('Children (736)'),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
