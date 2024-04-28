import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final int age;
  final List<String> imageUrls;
  final List<String> interests;
  final String bio;
  final String jobTitle;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrls,
    required this.interests,
    required this.bio,
    required this.jobTitle,
  });

  @override
  List<Object?> get props => [id, name, age, imageUrls, interests, bio, jobTitle];

  // Factory constructor for creating a User instance from a Firestore document.
  factory User.fromFirestore(Map<String, dynamic> doc) {
    return User(
      id: doc['id'] as int,  // Assuming the ID is stored as an integer in Firestore
      name: doc['name'] as String,
      age: doc['age'] as int,
      imageUrls: List<String>.from(doc['imageUrls'] ?? []),
      interests: List<String>.from(doc['interests'] ?? []),
      bio: doc['bio'] as String,
      jobTitle: doc['jobTitle'] as String,
    );
  }

  // Example static list of users for other use cases (this might not be needed in your production app)
  static List<User> users = [
    User(
      id: 1,
      name: 'Nick',
      age: 25,
      imageUrls: [
        'https://via.placeholder.com/150',
      ],
      interests: ['Music', 'Coding', 'Gaming'],
      jobTitle: 'Software Engineer',
      bio: 'Love to code and play games.',
    ),
    // More predefined users can be added here
  ];
}