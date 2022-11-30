class TransactionModel{
  final bool isWithdraw;
  final DateTime transDate;
  final String price;
  final String transMethod;

  TransactionModel({required this.isWithdraw, required this.transDate, required this.price, required this.transMethod});
}

List<TransactionModel> transactions = [
  TransactionModel(isWithdraw: true, transDate: DateTime.now(), price: '200.00 Birr', transMethod: 'Mobile Debit'),
  TransactionModel(isWithdraw: false, transDate: DateTime.now(), price: '850.00 Birr', transMethod: 'Mobile Credit'),
  TransactionModel(isWithdraw: false, transDate: DateTime.now().subtract(const Duration(days: 1)), price: '100.00 Birr', transMethod: 'Mobile credit'),
  TransactionModel(isWithdraw: true, transDate: DateTime.now().subtract(const Duration(days: 1)), price: '2500.00 Birr', transMethod: 'ATM Cash Withdrawal'),
  TransactionModel(isWithdraw: false, transDate: DateTime.now().subtract(const Duration(days: 1)), price: '3200.00 Birr', transMethod: 'Mobile credit'),
  TransactionModel(isWithdraw: true, transDate: DateTime.now().subtract(const Duration(days: 1)), price: '450.00 Birr', transMethod: 'Mobile Debit'),
  TransactionModel(isWithdraw: true, transDate: DateTime.now().subtract(const Duration(days: 2)), price: '2000.00 Birr', transMethod: 'ATM Cash Withdrawal'),
  TransactionModel(isWithdraw: false, transDate: DateTime.now().subtract(const Duration(days: 2)), price: '600.00 Birr', transMethod: 'Mobile Credit'),
  TransactionModel(isWithdraw: false, transDate: DateTime.now().subtract(const Duration(days: 2)), price: '300.00 Birr', transMethod: 'Mobile Credit'),
  TransactionModel(isWithdraw: true, transDate: DateTime.now().subtract(const Duration(days: 3)), price: '9000.00 Birr', transMethod: 'Mobile Debit'),
];