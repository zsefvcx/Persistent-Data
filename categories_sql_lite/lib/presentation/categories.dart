import 'package:categories_sql_lite/core/core.dart';
import 'package:categories_sql_lite/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/category_card.dart';

class CategoriesPage extends StatefulWidget {
  static const routeName = '/cat';
  const CategoriesPage({
    super.key,
    required this.group,
  });

  final Group group;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final TextEditingController _category = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> loadData() async {
    context.read<CategoriesBloc>().add(CategoriesBlocEvent.getCategories(group: widget.group, page: 0));
  }

  Future<void> addData() async {
    context.read<CategoriesBloc>().add(CategoriesBlocEvent.insertCategory(
      value: Category(
        id: null,
        gid: widget.group.gid!,
        category: _category.text,
        description: _description.text,
        image: _image.text,
      ),
    ),
    );
  }

  @override
  void initState() {
    super.initState();
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title:Text(widget.group.group),
          ),

          body: BlocBuilder<CategoriesBloc, CategoriesBlocState>(
            builder: (context, state) {
              return state.map(
                loading: (_) {
                  return const Center(child: CircularProgressIndicator());
                },
                error: (_) {
                  return const Placeholder();   //ErrorTimeOutWidget();
                },
                timeOut: (_) {
                  return const Placeholder();   //ErrorTimeOutWidget();
                },
                loaded: ( value) {
                  return ListView.separated(
                    itemCount: value.model.categories.categories.length,
                    itemBuilder: (_, i) => CategoryCard(category: value.model.categories.categories.toList()[i]),
                    separatorBuilder: (_, __) => const Divider(color: Colors.lightBlueAccent),
                  );
                },
              );
            },
          ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: (){
                  _dialogBuilder(context);
                  //Logger.print('${Categories.instance().categories}', name: 'log', level: 0, error: false);
                },
                tooltip: 'Add a new Group',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10,),
              FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: () async {
                  await loadData();
                  //Logger.print('${Categories.instance().categories}', name: 'log', level: 0, error: false);
                },
                tooltip: 'Reload Groups',
                child: const Icon(Icons.update),
              ),
            ],
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
              child: const Text('Add'),
              onPressed: () async {
                var cSt = _formKey.currentState;
                if(cSt != null && cSt.validate()){
                  addData();
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
