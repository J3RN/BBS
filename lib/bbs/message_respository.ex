defmodule BBS.MessageRepository do
  use GenServer

  # Server

  def init(messages) do
    {:ok, messages}
  end

  def handle_call({:post, message}, _from, messages) do
    {:reply, :ok, [message | messages]}
  end

  def handle_call(:read_all, _from, messages) do
    {:reply, messages, messages}
  end

  # Client

  def post(message) do
    GenServer.call(BBS.MessageRepository, {:post, message})
  end

  def read_all() do
    GenServer.call(BBS.MessageRepository, :read_all)
  end
end
