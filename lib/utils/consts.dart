import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/user.dart';

const myPadding = 10.0;

const myBlack = Colors.black;
const myWhite = Colors.white;

const myGradient = LinearGradient(
  colors: [
    Color(0XFFfeda75),
    Color(0XFFfa7e1e),
    Color(0XFFd62976),
    Color(0XFF962fbf),
    Color(0XFF4f5bd5),
  ]
);

List<User> listOfUsers = [
  User(name: 'abd_ul_rafay', email: '', username: '', imageUrl: 'https://scontent.fskt1-1.fna.fbcdn.net/v/t39.30808-6/263182763_113432787842617_3396367383637533116_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGRwrcZB7wQgpzb4sk5Ig6PQZn7yrqbgKRBmfvKupuApOIxL-3jIFSR64KK7FMK7KqoadBbXIL5nsqR9GbEVEDb&_nc_ohc=C4HRTInZjJ4AX_8UKoi&_nc_ht=scontent.fskt1-1.fna&oh=00_AfChSeei9x-y8THxcvBQYaKXlkFFXxjiqDD7-EEn7KSMVw&oe=63EFC9BB'),
  User(name: 'tom_glory', email: '', username: '', imageUrl: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
  User(name: '_sam422_', email: '', username: '', imageUrl: 'https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/17528/thumb_UI_Basel.jpeg'),
  User(name: 'sara.an.odize', email: '', username: '', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN1TxWGPfaC1jI69SN_CQoGz9rFgX1rRHhDQ&usqp=CAU'),
  User(name: 'harry_gaze', email: '', username: '', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsDfvr1Vk5aS9ZNjr31wqEmz9rlGKySt0fvg&usqp=CAU'),
  User(name: 'mayer_nake', email: '', username: '', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7QYrGpTv3-TXgjHYYcXD2XX6m6um6phjnAxnQV0WW1ahxIUJ5RyIgwkWTHV3iQqPzLOI&usqp=CAU'),
  User(name: 'mitch_boy', email: '', username: '', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe5DATMONzTBLO6ipHz4H4ynz87qzMT7BeyuNaaZdzmVzhfsjyvXzcoMtIooO_5s6mbf4&usqp=CAU'),
];

List<Post> listOfPosts = [
  Post(user: listOfUsers[0], postImageUrl: 'https://www.stockphotosecrets.com/wp-content/uploads/2021/06/photocase_photo_id_3236595_square-550x550.jpg', caption: 'Beautiful picture 😍', day: '1 day ago', likes: 112589),
  Post(user: listOfUsers[3], postImageUrl: 'https://res.cloudinary.com/simpleview/image/upload/v1555350058/clients/huntsville/K3163818_5e53f4d4-9324-40f1-b549-64b9f74f95bd.jpg', caption: 'Look what I captured 🔥', day: '4 days ago', likes: 3920),
  Post(user: listOfUsers[1], postImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ6LkNL54VEjJerX8iXqb2rKBWBewUZPfd1w&usqp=CAU', caption: 'Wow ❤️', day: '3 weeks ago', likes: 32041),
];
