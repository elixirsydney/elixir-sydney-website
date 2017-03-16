defmodule ElixirSydney.Web.PageView do
  use ElixirSydney.Web, :view

  def markdown_to_html(markdown) do
    {:safe, Earmark.as_html!(markdown)}
  end

  def short_date(date) do
    Timex.format!(date, "{Mfull} {YYYY}")
  end

  def long_date(date) do
    Timex.format!(date, "{WDfull}, {D} {Mfull} {YYYY}")
  end

  def meetup_time do
    "6:00pm - 8:30pm"
  end

  def short_month(date) do
    Timex.format!(date, "{Mshort}")
  end

end
