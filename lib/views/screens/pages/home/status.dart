import 'package:flutter/material.dart';

import '../../../../models/user.dart';
import '../../../../utils/consts.dart';


class Status extends StatelessWidget {
  final int index;
  final User user;
  const Status({Key? key, required this.index, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2.5),
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: myGradient,
                    border: Border.all(
                      width: 0.5,
                    )
                ),
                child: Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: NetworkImage(user.imageUrl),
                      ),
                    ),
                  ),
                ),
              ),
              (index == 0)? Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                  ),
                  child: const Center(
                    child: Icon(Icons.add, size: 20.0, color: Colors.white,),
                  ),
                ),
              ) : const SizedBox(),
            ],
          ),
          const SizedBox(height: 5.0),
          Text(user.name),
        ],
      ),
    );
  }
}
