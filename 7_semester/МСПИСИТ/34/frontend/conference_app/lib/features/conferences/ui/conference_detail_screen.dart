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
                child: Text('Error loading conference details'));
          }

          final conference = snapshot.data!;
          _nameController.text = conference.name;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (conference.canRedact)
                  TextField(
                    enabled: conference.canRedact,
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Conference Name',
                      border: OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Name: ${conference.name}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                const Divider(),
                _buildDetailRow(Icons.location_city, 'City', conference.city),
                _buildDetailRow(Icons.topic, 'Topic', conference.topic),
                const Divider(),
                _buildDetailRow(
                    Icons.date_range, 'Start Date', conference.startDate),
                _buildDetailRow(
                    Icons.date_range, 'End Date', conference.endDate),
                const SizedBox(height: 16),
                Text(
                  'Description:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  conference.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Contacts:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  conference.contacts,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  'Participants: ${conference.participantCount}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton(
                      context: context,
                      label: conference.isUserAttending
                          ? 'Cancel Registration'
                          : 'Register',
                      color: conference.isUserAttending
                          ? Colors.red
                          : Colors.green,
                      onPressed: () async {
                        if (conference.isUserAttending) {
                          await _conferenceDetailedManager
                              .cancelConferenceRegistration(conference.id);
                        } else {
                          await _conferenceDetailedManager
                              .registerForConference(conference.id);
                        }
                        setState(() {
                          _conferenceDetailFuture = _conferenceDetailedManager
                              .getDetailedConference(widget.conferenceId);
                        });
                      },
                    ),
                    if (conference.canRedact) ...[
                      _buildActionButton(
                        context: context,
                        label: 'Update',
                        color: Theme.of(context).primaryColor,
                        onPressed: () async {
                          await _conferenceDetailedManager.updateConference(
                            conference.id,
                            ConferenceUpdatingRequest(
                              name: _nameController.text,
                              // Add additional fields for the update request
                            ),
                          );
                        },
                      ),
                      _buildActionButton(
                        context: context,
                        label: 'Delete',
                        color: Colors.red,
                        onPressed: () async {
                          await _conferenceDetailedManager
                              .deleteConference(conference.id);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            '$title: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
      ),
      child: Text(label),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
