import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  const UserWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Row(
        children: [
          Image.network(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
