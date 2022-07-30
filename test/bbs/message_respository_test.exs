defmodule BBS.MessageRespositoryTest do
  use ExUnit.Case

  test "posting messages" do
    response = BBS.MessageRepository.post("Block Party!")
    assert response == :ok
  end

  test "reading messages" do
    BBS.MessageRepository.post("Block Party!")
    messages = BBS.MessageRepository.read_all()

    assert "Block Party!" in messages
  end
end
