// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/common_widgets/common_padding.dart';
import 'package:counter_cubit/src/features/items/view_models/item_view_model.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ItemsViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              context.read<ItemsViewModel>().removeAllItems();
            },
          ),
        ],
      ),
      body: CommonPadding(
        child: viewModel.state.items.isNotEmpty
            ? ListView.builder(
                itemCount: viewModel.state.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('$index'),
                    ),
                    title: Text('Item $index'),
                  );
                },
              )
            : const Center(child: Text('The list is empty.')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('addItemToList'),
            child: const Icon(Icons.add_outlined),
            onPressed: () {
              context.read<ItemsViewModel>().addItemToList();
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('removeItemFromList'),
            child: const Icon(Icons.remove_outlined),
            onPressed: () {
              context.read<ItemsViewModel>().removeItemFromList();
            },
          ),
        ],
      ),
    );
  }
}
