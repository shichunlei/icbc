enum IncomeExpenditureType {
  income(text: "收入"),
  expenditure(text: "支出");

  final String text;

  const IncomeExpenditureType({required this.text});
}
