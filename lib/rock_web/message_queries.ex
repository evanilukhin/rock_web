defmodule RockWeb.Message.Queries do
  import Ecto.Query
  alias RockWeb.Message

  def last_messages(count) do
    query = from m in Message, order_by: [desc: m.inserted_at], limit: ^count
    RockWeb.Repo.all(query)
  end
end
