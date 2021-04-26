defmodule Elog.Log do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :data]}

  schema "logs" do
    field :data, :map

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:data])
    |> validate_required([:data])
    |> validate_required_map(:data)
  end

  defp validate_required_map(changeset, field) when is_atom(field) do
    validate_change(changeset, field, fn
      current_field, value when is_map(value) ->
        if map_size(value) > 0 do
          []
        else
          [{current_field, "Some error"}]
        end

      current_field, _ ->
        [{current_field, "This field must be a map"}]
    end)
  end
end
