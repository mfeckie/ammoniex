defmodule Ammoniex.Nif do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :ammoniex,
    crate: :ammoniex,
    base_url: "",
    force_build: "",
    targets: RustlerPrecompiled.Config.default_targets(),
    version: version

  @doc """
  Given an unsanitized string of HTML, cleans any malicious code

  ## Example

      iex> Ammoniex.HTML.clean(~s[<a onclick="function() { alert("hello")">hijack</a>])
      ~s[<a rel="noopener noreferrer">hijack</a>]
  """
  def clean(_arg1), do: :erlang.nif_error(:nif_not_loaded)
end
