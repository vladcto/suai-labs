import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  static const _buttonsPadding = 16.0;

  final List<SideBarElement> elements;

  const SideBar({Key? key, required this.elements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 250, 250),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(85),
            blurRadius: 8,
            offset: const Offset(6, 0),
          )
        ],
      ),
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: elements
            .map(
              (e) => Column(
                children: [
                  ElevatedButton(
                    onPressed: e.onTap,
                    child: Text(e.title),
                  ),
                  const SizedBox(height: _buttonsPadding),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class SideBarElement {
  final String title;
  final VoidCallback onTap;

  SideBarElement(this.title, this.onTap);
}
