import 'package:flutter/material.dart';

class CustomImageBuilder extends StatelessWidget {
  const CustomImageBuilder({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Image build(BuildContext context) {
    return Image.network(
     url,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes !=
                    null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
