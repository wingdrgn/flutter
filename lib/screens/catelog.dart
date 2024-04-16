import 'package:flutter/material.dart';
import 'package:flutter_learn/models/cart.dart';
import 'package:flutter_learn/models/catelog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyCatelog extends StatelessWidget {
  const MyCatelog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _MyAppBar(),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)))
      ],
    ));
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Catelog',
        style: Theme.of(context).textTheme.displayLarge,
      ),
      floating: true,
      actions: [
        IconButton(
            onPressed: () => context.go('/catelog/cart'),
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;
  const _AddButton({required this.item});
  @override
  Widget build(BuildContext context) {
    var isInCart =
        context.select<CartModel, bool>((cart) => cart.items.contains(item));

    return TextButton(
        onPressed: isInCart
            ? null
            : () {
                var cart = context.read<CartModel>();
                cart.add(item);
              },
        child: isInCart
            ? const Icon(Icons.check, semanticLabel: 'ADDED')
            : const Text('Add'));
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);
  @override
  Widget build(BuildContext context) {
    var item = context
        .select<CatelogModel, Item>((catelog) => catelog.getByPosition(index));
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: LimitedBox(
          maxHeight: 48,
          child: Row(
            children: [
              AspectRatio(aspectRatio: 1, child: Container(color: item.color)),
              Expanded(child: Text(item.name, style: textTheme)),
              _AddButton(item: item)
            ],
          )),
    );
  }
}
