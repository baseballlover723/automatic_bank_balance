defmodule AutomaticBankBalanceWeb.PageControllerTest do
  use AutomaticBankBalanceWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert redirected_to(conn)
  end
end
