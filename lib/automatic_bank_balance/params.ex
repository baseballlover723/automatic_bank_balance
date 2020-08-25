defmodule AutomaticBankBalance.Params do
  use TypedStruct

  typedstruct enforce: true do
    field :id, integer()
  end
end
