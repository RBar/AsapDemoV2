// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(
          FontAwesomeIcons.chevronLeft,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Supermercado Rey", //! USER NAME
              ),
              Text(
                "+879697897056", //! USER CELLPHONE
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/images/placeholder.png',
                image:
                    "https://www.nicepng.com/png/detail/34-348213_black-professional-women-professionals-black-business-woman-png.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
