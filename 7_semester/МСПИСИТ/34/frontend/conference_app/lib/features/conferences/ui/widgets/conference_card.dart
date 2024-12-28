import 'package:flutter/material.dart';

import '../../data/models/conference_short_response.dart';

class ConferenceCard extends StatelessWidget {
  final ConferenceShortResponse conference;
  final VoidCallback onTap;

  const ConferenceCard({
    super.key,
    required this.conference,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  conference.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.location_city,
                        size: 16, color: Colors.black45),
                    const SizedBox(width: 4),
                    Text(
                      conference.city,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.topic, size: 16, color: Colors.black45),
                    const SizedBox(width: 4),
                    Text(
                      conference.topic,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.people, size: 16, color: Colors.black45),
                    const SizedBox(width: 4),
                    Text(
                      'Participants: ${conference.participantCount}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      conference.isUserAttending
                          ? Icons.check_circle
                          : Icons.cancel,
                      size: 16,
                      color: conference.isUserAttending
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      conference.isUserAttending
                          ? 'You are attending'
                          : 'You are not attending',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Divider(color: Colors.grey[300]),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.date_range,
                        size: 16, color: Colors.black45),
                    const SizedBox(width: 4),
                    Text(
                      'Start: ${conference.startDate}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.date_range,
                        size: 16, color: Colors.black45),
                    const SizedBox(width: 4),
                    Text(
                      'End: ${conference.endDate}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
