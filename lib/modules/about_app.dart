import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4E4E4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Daily Task Management App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Introduction:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'In this article, we will explore the concept and functionality of a daily task management application that leverages a SQL database. Task management apps have become an essential tool for individuals and organizations to organize and track their daily activities efficiently. By employing a SQL database, this application ensures robust data storage, retrieval, and manipulation, providing users with a seamless and reliable task management experience.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Overview of the App:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'The daily task management app aims to help users create, prioritize, update, and complete tasks within a user-friendly interface. By utilizing a SQL database, the app ensures data integrity, scalability, and ease of access. Let\'s delve into the key features and implementation details of the app.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. User Registration and Authentication:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'To ensure security and personalized task management, the app incorporates a user registration and authentication system. This process verifies user credentials and allows individuals to create and manage their unique accounts securely.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Task Creation and Categorization:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Once authenticated, users can create tasks by entering relevant details such as task name, description, due date, and priority level. The app utilizes SQL to store these task details in a structured manner. Additionally, tasks can be categorized into different types or labels, enabling users to organize their tasks based on projects, contexts, or other customized categories.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '3. Task Listing and Filtering:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'The app provides users with a comprehensive list of their tasks, allowing them to view and track their daily, upcoming, and completed tasks. Users can apply filters to sort and narrow down the task list based on various criteria such as due date, priority, or category.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '4. Task Updates and Reminders:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Users can update their tasks by modifying task details, such as changing the due date, priority, or description. The SQL database facilitates efficient updating and ensures that all changes are accurately reflected in the system. Additionally, the app can send reminders or notifications to users regarding upcoming or overdue tasks, improving productivity and task completion rates.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '5. Task Completion and Progress Tracking:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'As users complete their tasks, the app provides options to mark them as completed. The SQL database records the completion status, allowing users to track their progress and view completed tasks for reference. This feature helps users stay organized and assess their productivity over time.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Conclusion:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'By leveraging the power of SQL databases, the daily task management app discussed in this article offers users a robust and efficient solution for organizing and managing their daily activities. The integration of SQL enables secure data storage, seamless updates, and flexible querying capabilities, enhancing the overall user experience. With its user-friendly interface and powerful functionality, this app can greatly assist individuals and teams in maximizing productivity and achieving their goals.',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'by: Adnan khella',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
