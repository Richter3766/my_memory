import 'package:flutter/cupertino.dart';
import 'package:my_memory/provider/selected_date.dart';
import 'package:provider/provider.dart';

class HomeTopBody extends StatelessWidget {
  const HomeTopBody({super.key});

  @override
  Widget build(BuildContext context) {
    DateModel dateModel = Provider.of<DateModel>(context, listen: false);
    return SizedBox(
      height: 200,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "20${dateModel.date.split(' ')[0].split('.')[0]}년",
          ),
        )
      )
    );
  }

}