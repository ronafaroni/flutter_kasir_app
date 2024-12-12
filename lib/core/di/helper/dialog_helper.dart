import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogHelper {
  static showSnackBar(required BuildContext context, required String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}

static showButtonSheetDialog({
  required BuildContext context,
  required String title,
 bool canDismiss = true,
 required Widget content
}) {
  showBottomSheet(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    isDismissible: canDismiss,
    enableDrag: canDismiss,
    builder: (context) => SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(title),
                (canDismiss) ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ) : SizedBox()
            ],
          )
        ],
        ),
      )
    )
    )
  );
}