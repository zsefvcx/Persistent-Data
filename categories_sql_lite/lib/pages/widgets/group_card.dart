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
    bool removed = false;
    // int? id = group.gid;
    final ValueNotifier<bool> removedNotifier = ValueNotifier<bool>(removed);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/err'),
        child: Card(
          child: SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Placeholder(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: ValueListenableBuilder<bool>(
                            valueListenable: removedNotifier,
                            builder: (_, value, __) => value
                                ? Text(group.group,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ))
                                : Text(
                                    group.group,
                                    style: theme.textTheme.titleLarge,
                                  ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            group.description,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: removedNotifier,
                  builder: (_, value, __) => Visibility(
                    visible: !value,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () async {
                            removedNotifier.value = true;
                            if (removedNotifier.value == true) {
                              Categories.instance().group.removeEx(value: group);
                            }
                          },
                          icon: const Icon(Icons.delete_forever)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
