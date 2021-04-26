defmodule ElogWeb.LogsController do
  use ElogWeb, :controller

  alias Elog.Log
  alias Elog.Logs.{Create, GetAll}

  alias ElogWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Log{} = log} <- Create.call(%{"data" => params}) do
      conn
      |> put_status(:created)
      |> render("create.json", log: log)
    end
  end

  def get_all(conn, _params) do
    with {:ok, logs} <- GetAll.call() do
      conn
      |> put_status(:ok)
      |> render("get_all.json", logs: logs)
    end
  end
end
