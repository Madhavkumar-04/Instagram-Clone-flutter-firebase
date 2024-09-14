import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final datePublished;
  final String postId;
  final String username;
  final String postUrl;
  final String profImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.datePublished,
    required this.postId,
    required this.username,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'uid': uid,
    'description': description,
    'postId': postId,
    'postUrl': postUrl,
    'profImage': profImage,
    'datePublished': datePublished,
    'likes':likes
  };

  static Post fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        username: snapshot['username'],
        uid: snapshot['uid'],
        description: snapshot['description'],
        datePublished: snapshot['datePublished'],
        postId: snapshot['postId'],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage'],
        likes :snapshot['likes'],
    );
  }
}
