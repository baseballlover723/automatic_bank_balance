defmodule AutomaticBankBalance.Bank.AccountInfo do
  use TypedStruct

  typedstruct enforce: true do
    field :id, integer()
  end
end
