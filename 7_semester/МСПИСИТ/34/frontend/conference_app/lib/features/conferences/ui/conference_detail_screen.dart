import 'package:conference_app/features/conferences/data/models/conference_detail_response.dart';
import 'package:conference_app/features/di/conference_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/conference_updating_request.dart';
import '../logic/manager/conference_detailed_manager.dart';

class ConferenceDetailScreen extends ConsumerStatefulWidget {
  final int conferenceId;

  const ConferenceDetailScreen({super.key, required this.conferenceId});

  @override
  ConsumerState<ConferenceDetailScreen> createState() =>
      _ConferenceDetailScreenState();
}

class _ConferenceDetailScreenState
    extends ConsumerState<ConferenceDetailScreen> {
  late ConferenceDetailedManager _conferenceDetailedManager;
  late Future<ConferenceDetailResponse> _conferenceDetailFuture;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _conferenceDetailedManager =
        ref.read(ConferenceProviders.conferenceDetailedManager);
    _conferenceDetailFuture =
        _conferenceDetailedManager.getDetailedConference(widget.conferenceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conference Details')),
      body: FutureBuilder<ConferenceDetailResponse>(
        future: _conferenceDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text('Error loading conference details'),
            );
          }

          final conference = snapshot.data!;
          _nameController.text = conference.name;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (conference.canRedact)
                  TextField(
                    enabled: conference.canRedact,
                    controller: _nameController,
                    decoration: const InputDecoration(
                        labelText: 'Name', border: OutlineInputBorder()),
                  )
                else
                  Text('Name: ${conference.name}',
                      style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text('City: ${conference.city}'),
                Text('Topic: ${conference.topic}'),
                const SizedBox(height: 8),
                Text('Start Date: ${conference.startDate}'),
                Text('End Date: ${conference.endDate}'),
                const SizedBox(height: 16),
                Text('Description: ${conference.description}'),
                Text('Contacts: ${conference.contacts}'),
                if (conference.canRedact) ...[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await _conferenceDetailedManager.updateConference(
                            conference.id,
                            ConferenceUpdatingRequest(
                              name: _nameController.text,
                            ),
                          );
                        },
                        child: const Text('Update'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await _conferenceDetailedManager
                              .deleteConference(conference.id);
                          // Optionally, navigate back or show a confirmation
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
