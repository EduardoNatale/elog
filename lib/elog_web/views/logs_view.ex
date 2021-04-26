defmodule ElogWeb.LogsView do
  use ElogWeb, :view

  def render("create.json", %{log: log}) do
    %{
      message: "Log created!",
      log: log
    }
  end

  def render("get_all.json", %{logs: logs}) do
    %{
      logs: logs
    }
  end
end
