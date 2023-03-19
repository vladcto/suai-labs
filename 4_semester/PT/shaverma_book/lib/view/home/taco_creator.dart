import 'package:flutter/material.dart';

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
            ),
            TextField(
              controller: _descrTextController,
            ),
          ),
        ),
        Expanded(
          child: _SimpleRow(
            TextField(
              controller: _meatTextController,
            ),
            TextField(
              controller: _chesseTextController,
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: _createTaco,
            child: Text("press me"),
          ),
        )
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
