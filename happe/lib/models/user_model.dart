import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final int age;
  final List<String> imageUrls;
  final String bio;
  final String jobTitle;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrls,
    required this.bio,
    required this.jobTitle,
  });

  @override
  List<Object?> get props => [id, name, age, imageUrls, bio, jobTitle];

  static List<User> users = [
    const User(
      id: 1,
      name: 'Nick',
      age: 25,
      imageUrls: [
        'https://img.freepik.com/free-photo/close-up-portrait-happy-young-african-american-man-smiling-against-black-neon-studio-background_155003-22862.jpg?t=st=1713835854~exp=1713839454~hmac=296a591c5152f4dad45b149dda67d5a230b380da189bb09c73ad4efa2ce5bf1e&w=900',
        'https://img.freepik.com/free-photo/close-up-portrait-happy-young-african-american-man-smiling-against-black-neon-studio-background_155003-22862.jpg?t=st=1713835854~exp=1713839454~hmac=296a591c5152f4dad45b149dda67d5a230b380da189bb09c73ad4efa2ce5bf1e&w=900',
        'https://img.freepik.com/free-photo/close-up-portrait-happy-young-african-american-man-smiling-against-black-neon-studio-background_155003-22862.jpg?t=st=1713835854~exp=1713839454~hmac=296a591c5152f4dad45b149dda67d5a230b380da189bb09c73ad4efa2ce5bf1e&w=900',
        'https://img.freepik.com/free-photo/close-up-portrait-happy-young-african-american-man-smiling-against-black-neon-studio-background_155003-22862.jpg?t=st=1713835854~exp=1713839454~hmac=296a591c5152f4dad45b149dda67d5a230b380da189bb09c73ad4efa2ce5bf1e&w=900',
        'https://img.freepik.com/free-photo/close-up-portrait-happy-young-african-american-man-smiling-against-black-neon-studio-background_155003-22862.jpg?t=st=1713835854~exp=1713839454~hmac=296a591c5152f4dad45b149dda67d5a230b380da189bb09c73ad4efa2ce5bf1e&w=900',
      ],
      jobTitle: 'Software Engineer',
      bio: 'Hey my name is Nick and I am excited to use this application!',
    ),
    const User(
      id: 2,
      name: 'Benjamin',
      age: 25,
      imageUrls: [
        'https://img.freepik.com/free-photo/portrait-cheerful-man-white-shirt-standing_171337-12073.jpg?t=st=1713836072~exp=1713839672~hmac=c1bf4ff7261bdc1926ec83051347d8a03fb6a51463cea8cdb03c7b12f161d378&w=900',
        'https://img.freepik.com/free-photo/portrait-cheerful-man-white-shirt-standing_171337-12073.jpg?t=st=1713836072~exp=1713839672~hmac=c1bf4ff7261bdc1926ec83051347d8a03fb6a51463cea8cdb03c7b12f161d378&w=900',
        'https://img.freepik.com/free-photo/portrait-cheerful-man-white-shirt-standing_171337-12073.jpg?t=st=1713836072~exp=1713839672~hmac=c1bf4ff7261bdc1926ec83051347d8a03fb6a51463cea8cdb03c7b12f161d378&w=900',
        'https://img.freepik.com/free-photo/portrait-cheerful-man-white-shirt-standing_171337-12073.jpg?t=st=1713836072~exp=1713839672~hmac=c1bf4ff7261bdc1926ec83051347d8a03fb6a51463cea8cdb03c7b12f161d378&w=900',
        'https://img.freepik.com/free-photo/portrait-cheerful-man-white-shirt-standing_171337-12073.jpg?t=st=1713836072~exp=1713839672~hmac=c1bf4ff7261bdc1926ec83051347d8a03fb6a51463cea8cdb03c7b12f161d378&w=900',
      ],
      jobTitle: 'Laundry Accountant',
      bio: 'Hey my name is Benjamin and I am excited to use this application!',
    ),
    const User(
      id: 3,
      name: 'Ryan',
      age: 25,
      imageUrls: [
        'https://img.freepik.com/free-photo/handsome-man-presenting-something_1368-87.jpg?t=st=1713836525~exp=1713840125~hmac=827dfc79ed569ffef09c3d4d7e8f12130c0cc57a9aa53264c367c8e2f72042d9&w=360',
        'https://img.freepik.com/free-photo/handsome-man-presenting-something_1368-87.jpg?t=st=1713836525~exp=1713840125~hmac=827dfc79ed569ffef09c3d4d7e8f12130c0cc57a9aa53264c367c8e2f72042d9&w=360',
        'https://img.freepik.com/free-photo/handsome-man-presenting-something_1368-87.jpg?t=st=1713836525~exp=1713840125~hmac=827dfc79ed569ffef09c3d4d7e8f12130c0cc57a9aa53264c367c8e2f72042d9&w=360',
        'https://img.freepik.com/free-photo/handsome-man-presenting-something_1368-87.jpg?t=st=1713836525~exp=1713840125~hmac=827dfc79ed569ffef09c3d4d7e8f12130c0cc57a9aa53264c367c8e2f72042d9&w=360',
        'https://img.freepik.com/free-photo/handsome-man-presenting-something_1368-87.jpg?t=st=1713836525~exp=1713840125~hmac=827dfc79ed569ffef09c3d4d7e8f12130c0cc57a9aa53264c367c8e2f72042d9&w=360',
      ],
      jobTitle: 'Just Ken',
      bio: 'Hey my name is Ryan and I am excited to use this application!',
    ),
    const User(
      id: 4,
      name: 'Mali',
      age: 25,
      imageUrls: [
        'https://img.freepik.com/free-photo/vertical-full-length-image-fashionable-hipster-guy-getting-dress_343059-3683.jpg?t=st=1713836576~exp=1713840176~hmac=8cf48bfca73177cf61e02622ff058ae04e6738476977884a30344807b03d5f4b&w=360',
        'https://img.freepik.com/free-photo/vertical-full-length-image-fashionable-hipster-guy-getting-dress_343059-3683.jpg?t=st=1713836576~exp=1713840176~hmac=8cf48bfca73177cf61e02622ff058ae04e6738476977884a30344807b03d5f4b&w=360',
        'https://img.freepik.com/free-photo/vertical-full-length-image-fashionable-hipster-guy-getting-dress_343059-3683.jpg?t=st=1713836576~exp=1713840176~hmac=8cf48bfca73177cf61e02622ff058ae04e6738476977884a30344807b03d5f4b&w=360',
        'https://img.freepik.com/free-photo/vertical-full-length-image-fashionable-hipster-guy-getting-dress_343059-3683.jpg?t=st=1713836576~exp=1713840176~hmac=8cf48bfca73177cf61e02622ff058ae04e6738476977884a30344807b03d5f4b&w=360',
        'https://img.freepik.com/free-photo/vertical-full-length-image-fashionable-hipster-guy-getting-dress_343059-3683.jpg?t=st=1713836576~exp=1713840176~hmac=8cf48bfca73177cf61e02622ff058ae04e6738476977884a30344807b03d5f4b&w=360',
      ],
      jobTitle: 'Musician',
      bio: 'Hey my name is Mali and I am excited to use this application!',
    ),
    const User(
      id: 5,
      name: 'Beard',
      age: 25,
      imageUrls: [
        'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1713836616~exp=1713840216~hmac=99257a16a306cfc77b876226344e55eb8b5b10b9379661f26da6d206b3c9be08&w=900',
        'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1713836616~exp=1713840216~hmac=99257a16a306cfc77b876226344e55eb8b5b10b9379661f26da6d206b3c9be08&w=900',
        'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1713836616~exp=1713840216~hmac=99257a16a306cfc77b876226344e55eb8b5b10b9379661f26da6d206b3c9be08&w=900',
        'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1713836616~exp=1713840216~hmac=99257a16a306cfc77b876226344e55eb8b5b10b9379661f26da6d206b3c9be08&w=900',
        'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1713836616~exp=1713840216~hmac=99257a16a306cfc77b876226344e55eb8b5b10b9379661f26da6d206b3c9be08&w=900',
      ],
      jobTitle: 'Beard',
      bio: 'Hey my name is Beard and I am excited to use this application!',
    ),
  ];
}
