@override
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required String hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your implementation
  }
}

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarState());

  // Add your implementation here
}

class SearchBarState {
  final String content;

  SearchBarState({this.content = ''});
}

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBarCubit(),
      child: Column(
        children: [
          const SearchBar(hintText: "Search something..."),
          BlocBuilder<SearchBarCubit, SearchBarState>(
            buildWhen: (previous, current) => previous.content != current.content,
            builder: (context, state) {
              return Column(
                children: [
                  Text("You are searching: ${state.content}"),
                  ElevatedButton(
                    onPressed: () {
                      // Perform search logic here
                      // You can access the search query using state.content
                    },
                    child: const Text("Search"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
