import 'package:get_it/get_it.dart';
import 'package:personal_expense_manager/data/providers/implementation/counter_party_provider.dart';
import 'package:personal_expense_manager/data/providers/implementation/transaction_provider.dart';
import 'package:personal_expense_manager/data/providers/interface/icounter_party_provider.dart';
import 'package:personal_expense_manager/data/providers/interface/itransaction_provider.dart';

final locator = GetIt.instance;

Future<void> InitializeDependencyInjection() async{
  locator.registerSingleton<ICounterPartyProvider>(new CounterPartyProvider());
  locator.registerSingleton<ITransactionProvider>(new TransactionProvider());
}
