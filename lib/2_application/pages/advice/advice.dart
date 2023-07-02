import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/advisor_bloc.dart';

class AdvicePageWrapperProvider extends StatelessWidget {
  const AdvicePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvisorBloc(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: BlocProvider(
              create: (context) => AdvisorBloc(),
              child: BlocBuilder<AdvisorBloc, AdvisorState>(
                builder: (context, state) {
                  if (state is AdvisorInitial) {
                    return const Text('Initial state');
                  } else if (state is AdvisorLoadingState) {
                    return const CircularProgressIndicator(
                      color: Colors.red,
                    );
                  } else if (state is AdvisorLoadedState) {
                    return Text(state.advice);
                  } else if (state is AdvisorErrorState) {
                    return Text(state.error);
                  }
                  return const Placeholder();
                },
              ),
            ),
          ),
        ),
        const CustomButton()
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () =>
          BlocProvider.of<AdvisorBloc>(context).add(AdviceRequestedEvent()),
      child: const Text('Get Advice'),
    );
  }
}
