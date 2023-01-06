import 'package:counter_cubit/src/features/items/presentation/cubit/item_cubit.dart';
import 'package:counter_cubit/src/widgets/molecules/app_bar_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMolecule(
        title: const Text('Items'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () => context.read<ItemsCubit>().removeAllItems(),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<ItemsCubit, List<int>>(
          builder: (context, state) {
            return state.isEmpty
                ? const Center(child: Text('The list is empty.'))
                : ListView.separated(
                    itemCount: state.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8.0),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('$index'),
                        ),
                        title: Text('Item $index'),
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('addItemToList'),
            child: const Icon(Icons.add_outlined),
            onPressed: () => context.read<ItemsCubit>().addItemToList(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('removeItemFromList'),
            child: const Icon(Icons.remove_outlined),
            onPressed: () => context.read<ItemsCubit>().removeItemFromList(),
          ),
        ],
      ),
    );
  }
}
