import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_chat_app/models/message.dart';
import 'package:sample_chat_app/utils/extensions/date_time_ext.dart';

import '../../../bloc/app_cotrol/app_control_cubit.dart';

class MessageTile extends StatefulWidget {
  final Message message;
  final bool isCurrent;
  const MessageTile({
    Key? key,
    required this.message,
    required this.isCurrent,
  }) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  Message get message => widget.message;
  bool get isCurrent => widget.isCurrent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCurrent ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isCurrent) ...[
          _buildUserAvatar(),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: _buildText(),
        ),
        if (isCurrent) ...[
          const SizedBox(width: 8),
          _buildUserAvatar(),
        ],
      ],
    );
  }

  Widget _buildText() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrent
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.user?.name ?? '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            message.text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            message.createdAt.formatTime,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.network(
        message.user?.photo ?? '',
        height: 36,
        width: 36,
      ),
    );
  }
}
