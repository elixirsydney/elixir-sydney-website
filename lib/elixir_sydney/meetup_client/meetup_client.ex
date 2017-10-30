defmodule ElixirSydney.MeetupClient do

  @meetup_endpoint "https://api.meetup.com/"
  @group_name "sydney-ex"
  @meetup_api_key Application.fetch_env!(:elixir_sydney, :meetup_api_key)

  @get_group_events_params %{sign: "true", page: "1", key: @meetup_api_key}

  @default_http_client http_client: HTTPoison
  @http Application.get_env(:elixir_sydney, :meetup_client, @default_http_client)[:http_client]

  def get_group_events do
    @meetup_endpoint <> @group_name <> "/" <> "events"
    |> @http.get([], params: @get_group_events_params)
    |> handle_response()
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  defp handle_response({_, %{status_code: _, body: body}}) do
    {:error, Poison.Parser.parse!(body)}
  end

end