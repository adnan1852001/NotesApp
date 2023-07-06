import 'package:flutter/material.dart';

class AboutCourse extends StatelessWidget {
  const AboutCourse({Key? key}) : super(key: key);

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
          'Flutter ',
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
                'Flutter is an open-source UI (User Interface) toolkit developed by Google for building natively compiled applications for mobile, web, and desktop platforms from a single codebase. It allows developers to write code once and deploy it on multiple platforms without the need for significant platform-specific modifications.Here are some key features and concepts of Flutter:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Dart Programming Language:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Flutter uses the Dart programming language, which is also developed by Google. Dart is an object-oriented, class-based language with features like strong typing and just-in-time (JIT) compilation.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Widgets:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Flutter is based on a reactive programming model, where the UI is built using widgets. Widgets are the building blocks of the Flutter UI and represent the different visual and interactive elements of an application. Flutter provides a rich set of pre-built widgets, and developers can also create their own custom widgets.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '3. Hot Reload:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'One of the notable features of Flutter is Hot Reload, which allows developers to see the changes they make in the code immediately reflected in the app\'s UI, without losing the app\'s state. This feature significantly speeds up the development and iteration process.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '4. Cross-platform Development:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Flutter enables cross-platform development, allowing developers to create apps for iOS, Android, web, and desktop (Windows, macOS, and Linux) using a single codebase. This reduces development time and effort required to target multiple platforms.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '5. Performance:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                ' Flutter is known for its high-performance UI rendering, as it uses Skia, a powerful 2D rendering engine, to render UI components. Flutter apps can achieve native-like performance and are capable of running at 60 frames per second (fps).',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '6. Material Design and Cupertino:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Flutter provides a set of widgets that implement the Material Design guidelines for Android apps and Cupertino widgets that follow the iOS design patterns. This allows developers to create apps with a native look and feel on each platform.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                '7. Community and Ecosystem:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Flutter has a growing and active community of developers, which contributes to its ecosystem. There are various packages and plugins available through Flutter\'s package manager, Pub, that extend the functionality of Flutter apps.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                'Overall, Flutter provides a fast and efficient way to develop beautiful, responsive, and cross-platform applications. It has gained popularity among developers for its productivity, performance, and the ability to create visually appealing apps with a single codebase.',
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
