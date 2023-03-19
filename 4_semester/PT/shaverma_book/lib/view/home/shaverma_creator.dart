import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ShavermaCreator extends StatefulWidget {
  final Function(String name, String description, int checked, List<String> topings)
      onCreateShaverma;
  const ShavermaCreator({Key? key, required this.onCreateShaverma})
      : super(key: key);

  @override
  State<ShavermaCreator> createState() => _ShavermaCreatorState();
}

class _ShavermaCreatorState extends State<ShavermaCreator> {
  final _nameTextController = TextEditingController();
  final _descrTextController = TextEditingController();
  final _topingsTextController = TextEditingController();
  final _lavashController = TextEditingController();

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
              controller: _topingsTextController,
            ),
            TextField(
              controller: _lavashController,
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: _createShaverma,
            child: Text("press me"),
          ),
        )
      ],
    );
  }

  void _createShaverma() {
    String name = _nameTextController.text;
    String description = _descrTextController.text;
    int checkedI = 0;
    List<String> topings = ["Ничего"];
    widget.onCreateShaverma(name, description, checkedI, topings);
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
