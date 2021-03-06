defmodule RockWebWeb.ChatChannel do
  use RockWebWeb, :channel

  def join("chat:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chat:lobby).
  def handle_in("shout", payload, socket) do
    RockWeb.Repo.transaction fn ->
      RockWeb.Repo.insert!(%RockWeb.Message{author: payload["name"], text: payload["message"]})
      GenServer.cast(MessageProcessor, {:send_message,  Jason.encode!(payload)})
    end

    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
