defmodule Graphx do
  @moduledoc """
  TODO write better doc.

  Documentation for Graphx.
  """
  use GenServer

  @impl
  def init(graph) do
    {:ok, graph}
  end

  @impl
  # TODO what is from?
  def handle_call({:update, {key, val} = _node}, _from, state) do

    {:reply, Map.update!(state, key, val)}
  end
end
