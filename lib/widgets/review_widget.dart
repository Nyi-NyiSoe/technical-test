import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewWidget extends StatelessWidget {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;

  const ReviewWidget({
    Key? key,
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
  }) : super(key: key);

  List<Widget> buildStars(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(Icon(
        i < rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
      ));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(children: buildStars(rating )),
                const SizedBox(width: 8.0),
                Text(
                  DateFormat.yMMMd().format(DateTime.parse(date)),
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              comment,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              '- $reviewerName',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
