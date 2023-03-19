import 'package:flutter/material.dart';

import '../../Globals.dart';

class TacoCreator extends StatefulWidget {
  final Function(String name, String description, String meat, String chesse)
      onCreateTaco;
  const TacoCreator({Key? key, required this.onCreateTaco}) : super(key: key);

  @override
  State<TacoCreator> createState() => _TacoCreatorState();
}

class _TacoCreatorState extends State<TacoCreator> {
  final _nameTextController = TextEditingController();
  final _descrTextController = TextEditingController();
  final _meatTextController = TextEditingController();
  final _chesseTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _SimpleRow(
            TextField(
              controller: _nameTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Название тако",
              ),
            ),
            TextField(
              controller: _descrTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Описание",
              ),
            ),
          ),
        ),
        Expanded(
          child: _SimpleRow(
            TextField(
              controller: _meatTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Мясо",
              ),
            ),
            TextField(
              controller: _chesseTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Сыр",
              ),
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Globals.mainColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: GestureDetector(
                onTap: _createTaco,
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  void _createTaco() {
    String name = _nameTextController.text;
    String description = _descrTextController.text;
    String meat = _meatTextController.text;
    String chesse = _chesseTextController.text;
    widget.onCreateTaco(name, description, meat, chesse);
  }
}

class _SimpleRow extends StatelessWidget {
  final TextField _textField1, _textField2;

  const _SimpleRow(this._textField1, this._textField2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _textField1,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _textField2,
          ),
        ],
      ),
    );
  }
}
