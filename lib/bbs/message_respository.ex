defmodule BBS.MessageRepository do
  use Agent

  # Server

  def init(messages) do
    messages
  end

  def handle_post(messages, message) do
    [message | messages]
  end

  def handle_read_all(messages) do
    messages
  end

  # Client

  def post(message) do
    Agent.update(BBS.MessageRepository, BBS.MessageRepository, :handle_post, [message])
  end

  def read_all() do
    Agent.get(BBS.MessageRepository, BBS.MessageRepository, :handle_read_all, [])
  end

  def start_link(messages) do
    Agent.start_link(
      BBS.MessageRepository,
      :init,
      [messages],
      name: BBS.MessageRepository
    )
  end
end
