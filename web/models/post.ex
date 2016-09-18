defmodule Elixirhunt.Post do
  use Elixirhunt.Web, :model

  schema "posts" do
    field :title, :string
    field :company, :string
    field :location, :string
    field :content, :string
    field :logo, :string
    field :url, :string

    timestamps
  end

  @required_fields ~w(title company location content logo url)
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
