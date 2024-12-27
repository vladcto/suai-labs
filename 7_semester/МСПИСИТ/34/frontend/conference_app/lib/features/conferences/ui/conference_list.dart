import 'package:conference_app/features/conferences/data/models/topic.dart';
import 'package:conference_app/features/conferences/ui/widgets/conference_card.dart';
import 'package:conference_app/features/di/conference_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/city.dart';
import '../logic/manager/conference_list_manager.dart';

class ConferenceListScreen extends ConsumerStatefulWidget {
  const ConferenceListScreen({super.key});

  @override
  ConsumerState<ConferenceListScreen> createState() =>
      _ConferenceListScreenState();
}

class _ConferenceListScreenState extends ConsumerState<ConferenceListScreen> {
  late ConferenceListManager _conferenceListManager;
  final _nameController = TextEditingController();
  String? _nameFilter;
  int? _cityFilter;
  int? _topicFilter;

  @override
  void initState() {
    super.initState();
    _conferenceListManager =
        ref.read(ConferenceProviders.conferenceListManager);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _conferenceListManager.fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchOptions = ref.watch(ConferenceProviders.searchOptionsProvider);
    final conferenceList = ref.watch(ConferenceProviders.listProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Conferences')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _conferenceListManager.openCreateConferenceScreen();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTextInput(
                  'Name',
                  (value) => setState(() => _nameFilter = value),
                ),
                if (searchOptions != null)
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdownInput(
                          'City',
                          searchOptions.cities.cast<City?>().firstWhere(
                                (city) => city?.id == _cityFilter,
                                orElse: () => null,
                              ),
                          searchOptions.cities,
                          (value) => value.name,
                          (value) => setState(() => _cityFilter = value?.id),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildDropdownInput(
                          'Topic',
                          searchOptions.topics.cast<Topic?>().firstWhere(
                                (topic) => topic?.id == _topicFilter,
                                orElse: () => null,
                              ),
                          searchOptions.topics,
                          (value) => value.name,
                          (value) => setState(() => _topicFilter = value?.id),
                        ),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _conferenceListManager.updateSearch(
                          name: _nameFilter,
                          cityId: _cityFilter,
                          topicId: _topicFilter,
                        );
                      },
                      child: const Text('Apply Filters'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _nameFilter = null;
                          _cityFilter = null;
                          _topicFilter = null;
                          _nameController.clear();
                        });
                        _conferenceListManager.updateSearch(
                          name: null,
                          cityId: null,
                          topicId: null,
                        );
                      },
                      child: const Text('Reset Filters'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: conferenceList == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: conferenceList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _conferenceListManager
                            .openDetailedScreen(conferenceList[index].id),
                        child:
                            ConferenceCard(conference: conferenceList[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  Widget _buildTextInput(String label, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDropdownInput<T, R>(
    String label,
    T? value,
    List<T> items,
    String Function(T) mapper,
    ValueChanged<T?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<T>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: Text(mapper(item)),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
