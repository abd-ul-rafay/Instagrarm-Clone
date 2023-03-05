import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  Uint8List? _file;

  getImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: [
            SimpleDialogOption(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  uploadPost() {

  }

  @override
  Widget build(BuildContext context) {
    return (_file == null)?
      Scaffold(
        body: Center(
          child: TextButton(
            onPressed: ()=> getImage(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Add a Post', style: TextStyle(color: Colors.blue, fontSize: 16.0,),),
                SizedBox(width: 5.0,),
                Icon(Icons.upload),
              ],
            ),
          ),
        ),
      )
      : Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                _file = null;
              });
            },
          ),
          actions: [
            GestureDetector(
              onTap: uploadPost,
              child: Row(
                children: [
                  Text('Post', style: TextStyle(color: Theme.of(context).iconTheme.color)),
                  const SizedBox(width: 5.0,),
                  const Icon(Icons.upload),
                  const SizedBox(width: 5.0,),
                ],
              ),
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(_file!),
                  )
                ),
              ),
            ),
          ),
        ),
      );
  }
}
