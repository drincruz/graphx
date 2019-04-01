defmodule GraphxNode do
  @moduledoc """
  An Elixir representation of the Erlang `node` module.

  TODO more doc.
  """

  defmacro new(val) do
    quote do
    :node.new(unquote(val))
    end
  end
  defmacro new(val, children) do
    quote do
    :node.new(unquote(val), unquote(children))
    end
  end

  defmacro append_children(node, children) do
    quote do
      :node.append_children(unquote(node), unquote(children))
    end
  end
end
