part of 'add_transaction_cubit.dart';

@freezed
class AddTransactionState with _$AddTransactionState {
  const factory AddTransactionState.initial() = _Initial;
  const factory AddTransactionState.loading() = AddTransactionLoading;
  const factory AddTransactionState.error(Object error) = AddTransactionError;
  const factory AddTransactionState.success() = AddTransactionSuccess;
}
