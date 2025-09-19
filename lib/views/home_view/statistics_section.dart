import 'package:ai_interview_coach_app/backend/models/statistics_item_model.dart';
import 'package:ai_interview_coach_app/core/utilities/build_statistics_items_list.dart';
import 'package:ai_interview_coach_app/cubits/user_stats_cubit.dart';
import 'package:ai_interview_coach_app/cubits/user_stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsCubit, UserStatsState>(
      builder: (context, state) {
        if (state is UserStatsFilled) {
          final items = buildStatisticsItemsList(state.statsModel);
          return _buildFilledState(context, items: items);
        } else if (state is UserStatsRefershing) {
          final items = buildStatisticsItemsList(state.statsModel);
          return _buildFilledState(context, items: items);
        } else if (state is UserStatsError) {
          return _buildErrorState(context);
        } else {
          return _buildLoadingState(context);
        }
      },
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return SpinKitThreeBounce(
      color: Theme.of(context).colorScheme.onSurface,
      size: 20,
      duration: const Duration(milliseconds: 500),
    );
  }

  Widget _buildFilledState(
    BuildContext context, {
    required List<StatisticsItemModel> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) =>
                  Expanded(child: _buildStatisticsItem(context, model: item)),
            )
            .toList(),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Something went wrong',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsItem(
    BuildContext context, {
    required StatisticsItemModel model,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Text(
          model.score!,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: model.color,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          model.category!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
