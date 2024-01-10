import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    final pokemonAsyc = ref.watch(PokemonProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon id $pokemonId'),
      ),
      body: Center(
        child: pokemonAsyc.when(
          data: (data) => Text(data),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Icon(Icons.arrow_circle_up_rounded),
            onPressed: () {
              pokemonId++;
              setState(() {});
            },
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 2,
            child: const Icon(Icons.arrow_circle_down_rounded),
            onPressed: () {
              if (pokemonId <= 1) return;
              pokemonId--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
