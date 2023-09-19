import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_aql_lite/core/core.dart';
import 'package:photo_aql_lite/domain/domain.dart';
import 'package:provider/provider.dart';

class GroupCard extends StatefulWidget {
  const GroupCard({
    super.key,
    required this.group,
  });

  final Group group;

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  final TextEditingController _group = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Group group;

  Future<void> modifyData() async {
    context.read<GroupsBloc>().add(GroupsBlocEvent.updateGroup(
      oldValue: group,
      value: Group(
        gid: group.gid,
        group: _group.text,
        description: _description.text,
        image: _image.text,
        locator: ''
      ),
    ),
    );
    setState(() {
      group = Group(
        gid: group.gid,
        group: _group.text,
        description: _description.text,
        image: _image.text,
        locator: '',
      );
    });
  }

  @override
  void initState() {
    super.initState();
    group = widget.group;
  }

  @override
  void dispose() {
    super.dispose();
    _group.dispose();
    _image.dispose();
    _description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // int? id = group.gid;

    return Card(
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
                  imageUrl: group.image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          //colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                              group.group,
                              style: theme.textTheme.titleLarge,
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      _image.text = group.image;
                      _group.text = group.group;
                      _description.text = group.description;
                      await _dialogBuilder(context);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () async {
                          context.read<GroupsBloc>().add(GroupsBlocEvent.deleteGroup(value: group));
                      },
                      icon: const Icon(Icons.delete_forever)),
                ),
              ],
            )
          ],
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
            height: 300,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _group,
                      maxLines: 1,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Group Name',
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
                            maxLines: 1, //grow automatically
                            maxLength: 40,
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
