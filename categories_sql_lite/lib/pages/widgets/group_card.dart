import 'package:categories_sql_lite/core/core.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.group,
  });

  final Group group;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(child:
              Text(group.group,
                style: theme.textTheme.titleLarge,
              ),
              ),
            ),
            Expanded(
              child: Center(child:
              Text(group.description,
                style: theme.textTheme.bodySmall,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}