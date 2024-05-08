
import 'package:eschoolaire_app/constant.dart';
import 'package:flutter/material.dart';



class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notification> notifications = [
    Notification(
      title: 'Your child has been absent',
      content: 'Your child has been absent today. Please check the reason.',
    ),
    Notification(
      title: 'Teacher absence notice',
      content: 'The teacher is absent today. Classes will be rescheduled.',
    ),
    
    // Add more notifications as needed
  ];

  @override
  void initState() {
    super.initState();
    // Add a new notification when the page is initialized
    notifications.add(Notification(
      title: 'Points added to your child',
      content: 'Points have been added to your child\'s account.',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: NotificationCard(
              notification: notifications[index],
              onDelete: () {
                setState(() {
                  notifications.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final Notification notification;
  final VoidCallback onDelete;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationDetailPage(notification: notification)),
          );
        },
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(Icons.notifications_active, color: Colors.white),
        ),
        title: Text(
          notification.title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(notification.content, style: const TextStyle(color: Colors.grey)),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final Notification notification;

  const NotificationDetailPage({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(notification.title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Text(
              'Content:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(notification.content, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class Notification {
  final String title;
  final String content;

  Notification({required this.title, required this.content});
}
