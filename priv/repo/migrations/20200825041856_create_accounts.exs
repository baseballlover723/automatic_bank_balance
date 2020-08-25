defmodule AutomaticBankBalance.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :desired_balance, :integer
      add :type, :string
      add :priority, :integer
      add :account_number, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:accounts, [:user_id])
  end
end
