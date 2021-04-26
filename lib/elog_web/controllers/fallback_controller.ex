defmodule ElogWeb.FallbackController do
  use ElogWeb, :controller

  alias ElogWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
