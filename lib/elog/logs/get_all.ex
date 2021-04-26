defmodule Elog.Logs.GetAll do
  alias Elog.{Log, Repo}

  def call do
    Repo.all(Log)
    |> handle_get_all()
  end

  defp handle_get_all(Ecto.QueryError),
    do: {:error, %{result: "Logs not found", status: :not_found}}

  defp handle_get_all(result), do: {:ok, result}
end
