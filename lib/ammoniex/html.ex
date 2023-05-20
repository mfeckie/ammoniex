defmodule Ammoniex.HTML do
  @doc """
  Cleans HTML using the NIF.

  When given a string will sanitze any HTML tags and return the result.
  When given anything else will return an empty string.

  ## Examples

      iex> Ammoniex.HTML.clean("<p>hello</p><script>alert('hello')</script>")
      "<p>hello</p>"

      iex> Ammoniex.HTML.clean(%{})
      ""
  """
  def clean(string) when is_binary(string), do: Ammoniex.Nif.clean(string)
  def clean(_), do: ""
end
