import 'package:budget_tracker/di/di.dart';
import 'package:budget_tracker/features/list_transactions/list_transactions.dart';
import 'package:budget_tracker/utils/local_storage/local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_transaction_cubit.freezed.dart';
part 'add_transaction_state.dart';

@Singleton()
class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit() : super(const AddTransactionState.initial());

  Future<void> addTransaction(Transaction item) async {
    emit(const AddTransactionLoading());
    final localStorage = getIt<LocalStorage>();
    try {
      await localStorage.addTransaction(item);
      emit(const AddTransactionSuccess());
    } catch (e) {
      emit(AddTransactionError(e));
    }
  }
}
