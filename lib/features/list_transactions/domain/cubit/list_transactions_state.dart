part of 'list_transactions_cubit.dart';

@freezed
class ListTransactionsState with _$ListTransactionsState {
  const factory ListTransactionsState.initial() = _Initial;
  const factory ListTransactionsState.loading() = Loading;
  const factory ListTransactionsState.empty() = Empty;
  const factory ListTransactionsState.loaded(
      List<TransactionsGroup> groupedTransactionsList) = Loaded;
}
