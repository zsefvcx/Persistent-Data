
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_data_app_floor/core/core.dart';
import 'package:users_data_app_floor/domain/domain.dart';
import 'package:users_data_app_floor/presentation/widgets/dialogs/cards/dialog_cards_add_modify.dart';
import 'package:users_data_app_floor/presentation/widgets/dialogs/users/dialog_users_add_modify.dart';

class UserCard extends StatefulWidget {
  const UserCard({
    required this.user, super.key,
  });

  final User user;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  int age = 18;

  late User user;
  CardDetail? cardDetail;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    Logger.print('Init Card ${user.id}');
  }

  Future<bool> getCreditCartData() async {
    final (error, _, res) = await context.read<UsersBloc>().readCard(uuidUser: user.uuid);
    cardDetail = res;
    return error;
  }

  @override
  void dispose() {
    super.dispose();
    Logger.print('Dispose Card ${user.id}');
  }


  @override
  Widget build(BuildContext context) {
    final usersBloc = context.read<UsersBloc>();
    var localCardDetail = cardDetail;
    return Card(
      child: SizedBox(
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent[400],
                radius: 50,
                child: FutureBuilder(
                  future: usersBloc.getUint8List(user.locator??'', user.image),
                    builder: (context, snapshot) {
                      if( snapshot.hasError) return const Center(child: Text('Error'),);
                      if(!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator(),);
                      } else {
                          final aPhotosModel = snapshot.requireData;
                          return aPhotosModel!=null?CircleAvatar(
                          backgroundColor: Colors.greenAccent[400],
                          radius: 50,
                          backgroundImage: MemoryImage(
                              aPhotosModel.contents
                          ),):CircleAvatar(
                            backgroundColor: Colors.greenAccent[400],
                            radius: 50,
                            child: const Icon(Icons.no_photography_outlined),
                          );
                      }
                    },
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Name:  ${user.firstName} ${user.name} ${user.lastName}'),
                          Text('Age:   ${user.age}'),
                          Text('Phone: ${user.phone}'),
                          if (localCardDetail==null) FutureBuilder(
                            future: getCreditCartData(),
                            builder: (context, snapshot) {
                              if( snapshot.hasError) return const Center(child: Text('Error'),);
                              if(!snapshot.hasData) {
                                return const Center(child: CircularProgressIndicator(),);
                              } else {
                                localCardDetail = cardDetail;
                                return localCardDetail==null?const Text('Card: no card'):
                                Text('Card: ${localCardDetail?.cardNum?.substring(0,4)} .... .... ${localCardDetail?.cardNum?.substring(15,19)}');
                              }
                           },
                          ) else Text('Card: ${localCardDetail.cardNum?.substring(0,4)} .... .... ${localCardDetail.cardNum?.substring(15,19)}'),
                        ],
                      ),
                    ),
                  ),
                )
            ),
            Column(
              children: [
                // Center(child: IconButton(
                //   tooltip: 'id',
                //   icon: Text('${user.id}'),
                //   onPressed: null,)),
                IconButton(
                  tooltip: 'Edit Profile',
                  onPressed: () async {
                    final res = await showDialog<(bool, User)>(
                    context: context,
                    builder: (context)
                    {
                      return DialogAddModifyBuilder(user: user);
                    });
                    if(res !=null && res.$1){
                      setState(() {
                        user = res.$2;
                      });
                    }
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  tooltip: 'Edit Card',
                    onPressed: () async {
                      final res = await showDialog<(bool, CardDetail)>(
                          context: context,
                          builder: (context)
                          {
                            return DialogCardsAddModifyBuilder(cardDetail:
                            cardDetail,
                              uuidUser: user.uuid,);
                          });
                      if(res !=null && res.$1){

                        setState(() {
                          cardDetail = res.$2;
                        });
                        Logger.print('$cardDetail');
                      }

                      //
                    },
                    icon: const Icon(Icons.credit_card),
                ),
                IconButton(
                  tooltip: 'Delete User',
                    onPressed: () async {
                      usersBloc.add(UsersBlocEvent.delete(value: user));
                    },
                    icon: const Icon(Icons.delete_forever)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
