defmodule AutomaticBankBalanceWeb.PageController do
  use AutomaticBankBalanceWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/users")
  end
end
