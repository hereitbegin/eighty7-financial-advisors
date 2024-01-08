## Flutter Posts App
This Flutter application fetches posts from a sample API and displays them in a simple mobile app.

## Overview
The app consists of two main files:

main.dart: Contains the main entry point (main()) for the app. It initializes and runs the MyApp widget.

my_app.dart: Defines the MyApp class, which is a StatelessWidget. It sets up the material app and specifies the home page as MyHomePage.

my_home_page.dart: Defines the MyHomePage class, a StatefulWidget. It contains the logic for fetching and displaying posts.

post.dart: Defines the Post class, representing a post object. It has a factory method fromJson to convert JSON data to a Post object.

Features
The app fetches posts from the JSONPlaceholder API when the "Fetch Posts" button is pressed.

The fetched posts are displayed in a simple ListView using the Post class.

Future Improvements
Implement error handling for failed API requests.
Add loading indicators while fetching data.
Feel free to explore and enhance the app as needed!
