defmodule BBS.MessageRepository do
  use Agent

  def post(message) do
    Agent.update(BBS.MessageRepository, fn messages ->
      [message | messages]
    end)
  end

  def read_all() do
    Agent.get(BBS.MessageRepository, fn messages ->
      messages
    end)
  end

  def start_link(messages) do
    Agent.start_link(fn -> messages end, name: BBS.MessageRepository)
  end
end
