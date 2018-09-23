defmodule RockWeb.Message do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :author, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:author, :text])
    |> validate_required([:author, :text])
  end
end
