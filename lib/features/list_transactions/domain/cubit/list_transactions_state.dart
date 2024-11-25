part of 'list_transactions_cubit.dart';

@freezed
class ListTransactionsState with _$ListTransactionsState {
  const factory ListTransactionsState.initial() = _Initial;
  const factory ListTransactionsState.loading() = ListTransactionsLoading;
  const factory ListTransactionsState.empty() = ListTransactionsEmpty;
  const factory ListTransactionsState.success(
          List<TransactionsGroupByDate> groupedTransactionsList) =
      ListTransactionsSuccess;
}
