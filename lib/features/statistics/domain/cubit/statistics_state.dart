part of 'statistics_cubit.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState.initial() = _Initial;
  const factory StatisticsState.loading() = StatisticsLoading;
  const factory StatisticsState.error() = StatisticsError;
  const factory StatisticsState.empty() = StatisticsEmpty;
  const factory StatisticsState.loaded(StatisticsData data) = StatisticsLoaded;
}
