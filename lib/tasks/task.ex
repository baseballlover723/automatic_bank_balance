defmodule Mix.Tasks.Abb.MaintainBalance do
  use Mix.Task

  alias AutomaticBankBalance.{
    Bank,
    Processor
  }

  @shortdoc "this is my task"
  @impl Mix.Task
  def run(_args) do
    IO.puts("I'm running the task")

    acc1 = %Bank.Params{id: 1}
    acc2 = %Bank.Params{id: 2}
    maintain_balances([acc1, acc2])
  end

  def maintain_balances(account_infos) do

    account_infos
    |> Enum.take(1)
    |> Flow.from_enumerable(max_demand: 1, min_demand: 0)
    |> Flow.map(&init/1)
    |> Flow.partition
    |> Flow.map(&login/1)
    |> Flow.filter(&login_successful?/1)
    |> Flow.partition
    |> Flow.map(&get_balances/1)
    |> Flow.partition
    |> Flow.map(&calculate_transactions/1)
    |> Flow.filter(&has_transactions?/1)
    |> Flow.partition
    |> Flow.map(&make_transactions/1)
    |> Flow.partition
    |> Flow.map(&verify_transactions/1)
    |> Flow.partition
    |> Flow.map(&notify/1)
    |> Flow.map(fn state -> IO.inspect(state, label: "end state") end)
    |> Flow.run

  end

  def init(account_info) do
    %{:account_info => account_info}
  end

  def login(state) do
    %{:account_info => account_info} = state
    IO.puts "TODO login for #{account_info.id}"

    state
  end

  def login_successful?(state) do
    %{:account_info => account_info} = state
    IO.puts "TODO login successful? for #{account_info.id}"

    true
  end

  def get_balances(state) do
    %{:account_info => account_info} = state
    IO.puts "TODO get balances for #{account_info.id}"

    Map.put(state, :balance, 15)
  end

  def calculate_transactions(state) do
    %{:account_info => account_info, :balance => balance} = state
    IO.puts "TODO has transactions? for #{account_info.id}, balance: #{balance}"

    state
  end

  def has_transactions?(state) do
    %{:account_info => account_info, :balance => balance} = state
    IO.puts "TODO calculating transactions for #{account_info.id}, balance: #{balance}"

    true
  end

  def make_transactions(state) do
    %{:account_info => account_info, :balance => balance} = state
    IO.puts "TODO making transactions for #{account_info.id}, balance: #{balance}"

    state
  end

  def verify_transactions(state) do
    %{:account_info => account_info, :balance => balance} = state
    IO.puts "TODO verifying transactions for #{account_info.id}, balance: #{balance}"

    state
  end

  def notify(state) do
    %{:account_info => account_info, :balance => balance} = state
    IO.puts "TODO notifying for #{account_info.id}, balance: #{balance}"

    state
  end
end
