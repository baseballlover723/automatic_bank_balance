defmodule AutomaticBankBalanceWeb.PageController do
  use AutomaticBankBalanceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
