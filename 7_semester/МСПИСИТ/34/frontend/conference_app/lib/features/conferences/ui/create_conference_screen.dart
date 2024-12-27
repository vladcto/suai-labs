import 'package:conference_app/features/conferences/data/models/conference_request.dart';
import 'package:conference_app/features/di/conference_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateConferenceScreen extends ConsumerStatefulWidget {
  const CreateConferenceScreen({super.key});

  @override
  ConsumerState<CreateConferenceScreen> createState() =>
      _CreateConferenceScreenState();
}

class _CreateConferenceScreenState
    extends ConsumerState<CreateConferenceScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contactsController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  String? _selectedCity;
  String? _selectedTopic;
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  Widget build(BuildContext context) {
    final searchOptions = ref.watch(ConferenceProviders.searchOptionsProvider);
    final conferenceListManager =
        ref.watch(ConferenceProviders.conferenceListManager);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Conference')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextInput('Name', _nameController),
            _buildTextInput('Description', _descriptionController),
            _buildTextInput('Contacts', _contactsController),
            _buildDatePicker(context, 'Start Date', _selectedStartDate, (date) {
              setState(() => _selectedStartDate = date);
            }),
            _buildDatePicker(context, 'End Date', _selectedEndDate, (date) {
              setState(() => _selectedEndDate = date);
            }),
            // _buildTextInput('Image URL', _imageUrlController),
            if (searchOptions != null) ...[
              _buildDropdownInput(
                  'City', searchOptions.cities.map((e) => e.name).toList(),
                  (value) {
                setState(() => _selectedCity = value);
              }),
              _buildDropdownInput(
                  'Topic', searchOptions.topics.map((e) => e.name).toList(),
                  (value) {
                setState(() => _selectedTopic = value);
              }),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_selectedCity == null ||
                    _selectedTopic == null ||
                    _selectedStartDate == null ||
                    _selectedEndDate == null) {
                  return;
                }

                final request = ConferenceRequest(
                  name: _nameController.text,
                  cityId: searchOptions?.cities
                          .firstWhere((e) => e.name == _selectedCity)
                          .id ??
                      -1,
                  topicId: searchOptions?.topics
                          .firstWhere((e) => e.name == _selectedTopic)
                          .id ??
                      -1,
                  startDate: _selectedStartDate!.toIso8601String(),
                  endDate: _selectedEndDate!.toIso8601String(),
                  description: _descriptionController.text,
                  contacts: _contactsController.text,
                  imageUrl: _imageUrlController.text,
                );

                await conferenceListManager.createConference(request);
              },
              child: const Text('Create Conference'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        controller: controller,
      ),
    );
  }

  Widget _buildDropdownInput(
      String label, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items
            .map((item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, String label,
      DateTime? selectedDate, ValueChanged<DateTime?> onDateSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          onDateSelected(pickedDate);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          child: Text(selectedDate != null
              ? selectedDate.toLocal().toString().split(' ')[0]
              : 'Select Date'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _contactsController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
}
