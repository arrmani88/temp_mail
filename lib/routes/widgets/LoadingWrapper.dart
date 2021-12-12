import 'package:flutter/material.dart';

class LoadingWrapper extends StatelessWidget {
  Widget? child;
  bool isLoading;
  LoadingWrapper({Key? key, this.child, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: Stack(
        children: [

          if (child != null) child!,
          if (isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
