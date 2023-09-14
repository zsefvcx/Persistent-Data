import 'package:cached_network_image/cached_network_image.dart';
import 'package:categories_sql_lite/core/core.dart';
import 'package:flutter/material.dart';

import '../pages.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final TextEditingController _category = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late Category category;

  Future<void> modifyData() async {
    category = Category(
      id: category.id,
      gid: category.gid,
      category: _category.text,
      description: _description.text,
      image: _image.text,
    );
    await Categories.instance().categories.modEx(value: category);
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    category = widget.category;
  }

  @override
  void dispose() {
    super.dispose();
    _category.dispose();
    _image.dispose();
    _description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool removed = false;
    // int? id = group.gid;
    final ValueNotifier<bool> removedNotifier = ValueNotifier<bool>(removed);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => !removedNotifier.value?Navigator.of(context).pushNamed(CategoryPage.routeName, arguments: category):null,
        child: Card(
          child: SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                    imageUrl: category.image,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.scaleDown,
                            //colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                  ),),
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
                Column(
                  children: [
                    ValueListenableBuilder<bool>(
                    valueListenable: removedNotifier,
                    builder: (_, value, __) => Visibility(
                      visible: !value,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () async {
                              _image.text = category.image;
                              _category.text = category.category;
                              _description.text = category.description;
                              await _dialogBuilder(context);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new Group'),
          content: SizedBox(
            width: 300,

            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _category,
                      maxLength: 100,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Category Name',
                      ),
                      validator: (text) =>
                      (text == null || text.isEmpty)?
                      'Text is empty':
                      null,
                    ),
                  ),
                  const Divider(height: 20,),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _image,
                      maxLength: 255,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Image URL',
                      ),
                      validator: (value) {
                        ///Используем встроенный валидатор
                        if(value != null){
                          final Uri? uri = Uri.tryParse(value);
                          if(uri != null) {
                            if (!uri.hasAbsolutePath) {
                              return 'Please enter valid url';
                            } else {
                              return null;
                            }
                          }
                        }
                        return 'Please enter valid url';
                        ///Используем регулярные выражения
                        // String hasValidUrl(String value) {
                        //   String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                        //   RegExp regExp = new RegExp(pattern);
                        //   if (value.length == 0) {
                        //     return 'Please enter url';
                        //   }
                        //   else if (!regExp.hasMatch(value)) {
                        //     return 'Please enter valid url';
                        //   }
                        //   return null;
                        // }
                      },
                    ),
                  ),
                  const Divider(height: 20,),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _description,
                            keyboardType: TextInputType.multiline,
                            maxLines: null, //grow automatically
                            maxLength: 2048,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Modify'),
              onPressed: () async {
                var cSt = _formKey.currentState;
                if(cSt != null && cSt.validate()){
                  modifyData();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
