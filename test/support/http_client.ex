defmodule ElixirSydney.Test.HTTPClient do

  @meetup_api_response File.read!("test/fixtures/meetup_api_response.json")

  def get(_url, _headers, _params) do
    {:ok, %{status_code: 200, body: @meetup_api_response}}
  end

end