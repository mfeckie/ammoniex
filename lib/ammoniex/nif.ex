defmodule Ammoniex.Nif do
  use Rustler,
    otp_app: :ammoniex,
    crate: :ammoniex

  @doc """
  Given an unsanitized string of HTML, cleans any malicious code

  ## Example

      iex> Ammoniex.HTML.clean(~s[<a onclick="function() { alert("hello")">hijack</a>])
      ~s[<a rel="noopener noreferrer">hijack</a>]
  """
  def clean(_arg1), do: :erlang.nif_error(:nif_not_loaded)
end
