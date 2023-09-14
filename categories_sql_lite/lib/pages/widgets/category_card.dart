import 'package:categories_sql_lite/core/core.dart';
import 'package:flutter/material.dart';

import '../categories.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool removed = false;
    // int? id = group.gid;
    final ValueNotifier<bool> removedNotifier = ValueNotifier<bool>(removed);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => !removedNotifier.value?Navigator.of(context).pushNamed('/des', arguments: category):null,
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
                                ? Text(category.category,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ))
                                : Text(
                              category.category,
                              style: theme.textTheme.titleLarge,
                            ),
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
                              Categories.instance().categories.removeEx(value: category);
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
