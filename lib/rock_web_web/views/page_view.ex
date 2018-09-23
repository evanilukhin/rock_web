defmodule RockWebWeb.PageView do
  use RockWebWeb, :view

  def last_messages() do
    RockWeb.Message.Queries.last_messages(8)
    |> Enum.reverse
  end
end
