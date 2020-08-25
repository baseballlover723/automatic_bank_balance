defmodule AutomaticBankBalance.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :account_number, :string
    field :desired_balance, :integer
    field :name, :string
    field :priority, :integer
    field :type, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :desired_balance, :type, :priority, :account_number])
    |> validate_required([:name, :desired_balance, :type, :priority, :account_number])
  end
end
