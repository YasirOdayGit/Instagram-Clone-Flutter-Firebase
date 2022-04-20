import 'package:instagram_clone/modules/post_module.dart';

class UserModule {
  String? name; // name
  String? userName; // userName
  String? email; // email
  String? id; // id
  String? profilePicture; // profile picture url
  String? bio;
  List<Post>?
      posts; // posts id which contain the title likes comments and images

  UserModule({
    this.name,
    this.userName,
    this.email,
    this.id,
    this.profilePicture,
    this.bio,
    this.posts,
  });
  // factory
  factory UserModule.fromJSON(map) {
    return UserModule(
      name: map['name'] ?? "NaN",
      userName: map['userName'] ?? "NaN",
      email: map['email'] ?? "NaN",
      id: map['id'] ?? "NaN",
      profilePicture: map['profilePicture'] ?? "NaN",
      bio: map['bio'] ?? "NaN",
      posts: map['posts'] ?? [],
    );
  }
}
