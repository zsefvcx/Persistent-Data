import 'package:cached_network_image/cached_network_image.dart';
import 'package:categories_sql_lite/core/core.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/cpg';
  const CategoryPage({super.key, required this.category});

  final Category category;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.category.category),
      ),

      body:  SafeArea(
          child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: widget.category.image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.scaleDown,
                          //colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),),
              const VerticalDivider(width: 10,),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    reverse: false,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.category.description,
                        textAlign: TextAlign.justify,
                        textDirection:TextDirection.ltr,
                        softWrap: true,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
      ),
    );
  }
}
