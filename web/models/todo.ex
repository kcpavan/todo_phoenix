defmodule TodoMvc.Todo do
  use TodoMvc.Web, :model

  schema "todos" do
    field :title, :string
    field :completed, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(title completed)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
