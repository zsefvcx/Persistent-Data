import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_sql_lite/core/core.dart';
import 'package:photo_sql_lite/domain/domain.dart';
import 'package:provider/provider.dart';

class PhotoCard extends StatefulWidget {
  const PhotoCard({
    super.key,
    required this.photo,
  });

  final Photo photo;

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  final TextEditingController _photoName = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Photo photo;

  Future<void> modifyData(PhotosBloc photosBloc) async {
    final uuid = await photosBloc.writeToFile(_image.text, photo.locator);
    photosBloc.add(PhotosBlocEvent.update(
      oldValue: photo,
      value: Photo(
        id: photo.id,
        name: _photoName.text,
        image: _image.text,
        locator: uuid,
      ),
    ),
    );
    setState(() {
      photo = Photo(
        id: photo.id,
        name: _photoName.text,
        image: _image.text,
        locator: uuid,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    photo = widget.photo;
  }

  @override
  void dispose() {
    super.dispose();
    _photoName.dispose();
    _image.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PhotosBloc photosBloc = context.read<PhotosBloc>();
    return Card(
      child: SizedBox(
        height: 400,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: context.read<PhotosBloc>().getUint8List(photo.locator),
                    builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                      if(snapshot.hasError) return const Center(child: Text('Error Data'),);
                      if(!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator(),);
                      } else {
                        return Image.memory(snapshot.requireData);
                      }
                    },
                ),
              ),
            ),
            Column(
              children: [
                Center(child: Text('${widget.photo.id}')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () async {
                      _image.text = photo.image;
                      _photoName.text = photo.name;
                      _dialogBuilder(context, photosBloc);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () async {
                          context.read<PhotosBloc>().add(PhotosBlocEvent.delete(value: photo));
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

  void _dialogBuilder(BuildContext context, PhotosBloc photosBloc) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Add a new Photo')),
          content: SizedBox(
            width: 300,
            height: 180,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: _photoName,
                      maxLines: 1,
                      maxLength: 255,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Photo Name',
                      ),
                      validator: (text) =>
                      (text == null || text.isEmpty)?
                      'Text is empty':
                      null,
                    ),
                  ),
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
                  modifyData(photosBloc);
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
