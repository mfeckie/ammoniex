defmodule Ammoniex.HTML do
  def clean(nil), do: ""
  def clean(string), do: Ammoniex.Nif.clean(string)
end
