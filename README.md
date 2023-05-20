# Ammoniex

Thin wrapper for rust's [ammonia](https://docs.rs/ammonia/latest/ammonia)

To consume it in your projects, you'll need to have a Rust compiler [installed](https://www.rust-lang.org/en-US/install.html).

## Installation

The package can be installed by adding `ammoniex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ammoniex, "~> 0.2.1"}
  ]
end
```

Docs can be found at <https://hexdocs.pm/ammoniex>.

## Usage

Usage is very simple.  There's only one function `Ammoniex.HTML.clean/1`, which expects a string and returns a string.

It will sanitize any HTML to mitigate cross site scripting and other malicious code.

