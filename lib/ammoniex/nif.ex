defmodule Ammoniex.Nif do
  mix_config = Mix.Project.config()
  version = mix_config[:version]

  use RustlerPrecompiled,
    otp_app: :ammoniex,
    crate: :ammoniex,
    base_url: "https://github.com/mfeckie/ammoniex/releases/download/#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_EXAMPLE_BUILD") in ["1", "true"],
    targets: ~w(
      aarch64-apple-darwin
      aarch64-unknown-linux-gnu
      aarch64-unknown-linux-musl
      riscv64gc-unknown-linux-gnu
      x86_64-apple-darwin
      x86_64-pc-windows-msvc
      x86_64-pc-windows-gnu
      x86_64-unknown-linux-gnu
      x86_64-unknown-linux-musl
      x86_64-unknown-freebsd
    ),
    version: version

  @doc """
  Given an unsanitized string of HTML, cleans any malicious code

  ## Example

      iex> Ammoniex.HTML.clean(~s[<a onclick="function() { alert("hello")">hijack</a>])
      ~s[<a rel="noopener noreferrer">hijack</a>]
  """
  def clean(_arg1), do: :erlang.nif_error(:nif_not_loaded)
end
