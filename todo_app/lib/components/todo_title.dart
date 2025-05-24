import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget {
  const TodoTitle({super.key, required this.taskName, required this.taskComplete, this.onChanged});

  final String taskName;
  final bool taskComplete;
  final void Function(bool?)? onChanged;
  


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        child: Row(
          children: [
            Checkbox(
              value: taskComplete,
              onChanged: onChanged,
              activeColor: Colors.yellow,
            ),
            Text(
              taskName,
              style: TextStyle(
                decoration: taskComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: 20,

              )
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
