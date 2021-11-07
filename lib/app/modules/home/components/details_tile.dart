import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;

  const DetailsTile(
      {required this.title,
      required this.subTitle,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black45,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
