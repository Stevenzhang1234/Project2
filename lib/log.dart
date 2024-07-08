import 'package:flutter/material.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class logboxscreen extends StatefulWidget {
  const logboxscreen({super.key});

  @override
  State<logboxscreen> createState() => _logboxscreenState();
}

class _logboxscreenState extends State<logboxscreen> {
  final data = {
    "January": [
      "Item 1 (A)",
      "Item 2 (A)",
      "Item 3 (A)",
      "Item 4 (A)",
    ],
    "February": [
      "Item 1 (B)",
      "Item 2 (B)",
    ],
    "March": [
      "Item 1 (C)",
      "Item 2 (C)",
      "Item 3 (C)",
      "Item 4 (C)",
      "Item 5 (C)",
    ],
    "April": [
      "Item 1 (D)",
      "Item 2 (D)",
      "Item 3 (D)",
      "Item 4 (D)",
      "Item 5 (D)",
      "Item 6 (D)",
      "Item 7 (D)",
      "Item 8 (D)",
      "Item 9 (D)",
    ],
    "May": [],
    "June": [],
    "July": [],
    "August": [],
    "September": [],
    "October": [],
    "November": [],
    "December": [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA3CCD5),
        title: Text("Log"),
      ),
      body: ScrollableListTabScroller(
        itemCount: data.length,
        tabBuilder: (BuildContext context, int index, bool active) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            data.keys.elementAt(index),
            style: !active
                ? null
                : TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            Text(
              data.keys.elementAt(index),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ...data.values
                .elementAt(index)
                .asMap()
                .map(
                  (index, value) => MapEntry(
                    index,
                    ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        alignment: Alignment.center,
                        child: Text(index.toString()),
                      ),
                      title: Text(value),
                    ),
                  ),
                )
                .values
          ],
        ),
      ),
    );
  }
}
