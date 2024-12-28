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
                // Ввод имени и установка фильтра
                _buildTextInput(
                  'Name',
                  (value) => _conferenceListManager.updateSearch(name: value),
                ),
                if (searchOptions != null)
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdownInput(
                          'City',
                          searchOptions.cities.cast<City?>().firstWhere(
                                (city) =>
                                    city?.id ==
                                    _conferenceListManager.currentCityId,
                                orElse: () => null,
                              ),
                          searchOptions.cities,
                          (value) => value.name,
                          (value) => _conferenceListManager.updateSearch(
                            cityId: value?.id,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildDropdownInput(
                          'Topic',
                          searchOptions.topics.cast<Topic?>().firstWhere(
                                (topic) =>
                                    topic?.id ==
                                    _conferenceListManager.currentTopicId,
                                orElse: () => null,
                              ),
                          searchOptions.topics,
                          (value) => value.name,
                          (value) => _conferenceListManager.updateSearch(
                            topicId: value?.id,
                          ),
                        ),
                      ),
                    ],
                  ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Применить фильтры, это делается автоматически каждый раз, когда они изменяются
                      },
                      child: const Text('Apply Filters'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () => _conferenceListManager.clearFilter(),
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
                    itemBuilder: (BuildContext context, int index) {
                      final conference = conferenceList[index];
                      return ConferenceCard(
                        conference: conference,
                        onTap: () => _conferenceListManager
                            .openDetailedScreen(conference.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTextInput(String label, ValueChanged<String> onChanged) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
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
