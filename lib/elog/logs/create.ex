defmodule Elog.Logs.Create do
  alias Elog.{Log, Repo}

  def call(params) do
    params
    |> Log.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Log{}} = result), do: result

  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
