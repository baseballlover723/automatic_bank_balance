defmodule AutomaticBankBalance.Repo do
  use Ecto.Repo,
    otp_app: :automatic_bank_balance,
    adapter: Ecto.Adapters.Postgres
end
