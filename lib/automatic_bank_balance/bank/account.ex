defmodule AutomaticBankBalance.Bank.Account do
  use TypedStruct

  typedstruct enforce: true do
    field :account_number, String.t()
    field :balance, Money.t()
    field :human_balance, String.t(), enforce: false, default: :balance
    field :name, String.t()
    field :priority, pos_integer(), enforce: false
    field :type, atom()
  end
end
