defmodule AutomaticBankBalance.Processor.Bank.Balance do
  alias AutomaticBankBalance.Bank.{Account, AccountInfo}

  # TODO test this
  @spec get_account_balances(AccountInfo.t()) :: [Account.t()]
  def get_account_balances(account_info) do
    IO.inspect(account_info, label: "getting balances")

    {:ok, html} = get_html(account_info)

    {:ok, document} = Floki.parse_document(html)
    rows = document |> Floki.find(".account-tile-header")

    account_balances = rows
    # |> Stream.take(1)
    |> Stream.map(fn row ->
      # TODO check if want to get account number
      account_name = row |> Floki.find(".account-name") |> Floki.text() |> String.trim() |> String.downcase()
      {:ok, balance} = row |> Floki.find(".account-balance a") |> Floki.text() |> Money.parse(:USD)
      type = row |> Floki.find(".acct-tile") |> Floki.attribute("class") |> List.first |> String.split() |> List.last() |> String.to_atom()

      # {String.to_atom(account_name), balance}
      # %Account{}
      %Account{account_number: "1", balance: balance, human_balance: Money.to_string(balance), name: account_name, type: type}
    end)
    |> Enum.to_list()
    # |> Map.new

   account_balances
  end

  def get_html(_account_info) do
    File.read("test_files/Account Summary - Wells Fargo.html")
  end
end
