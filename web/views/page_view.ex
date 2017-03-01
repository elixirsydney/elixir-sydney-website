defmodule ElixirSydney.PageView do
  use ElixirSydney.Web, :view

  def markdown_to_html(markdown) do
    {:safe, Earmark.as_html!(markdown)}
  end
end
