defmodule ElixirSydney.Events do
  @moduledoc """
  The boundary for the Events system.
  """

  import Ecto.Query
  alias ElixirSydney.Repo
  alias ElixirSydney.Events.Meetup
  alias ElixirSydney.MeetupClient

  require Logger

  def next_meetup do
    Meetup
    |> order_by(desc: :date)
    |> first
    |> preload(:location)
    |> preload(talks: :presenter)
    |> Repo.one
  end

  def past_meetups do
    Meetup
    |> where([m], m.date < ^Date.utc_today)
    |> order_by(desc: :date)
    |> preload(talks: :presenter)
    |> Repo.all
  end

  @doc """
  Returns the list of meetups.

  ## Examples

      iex> list_meetups()
      [%Meetup{}, ...]

  """
  def all_meetups do
    Meetup
    |> order_by(desc: :date)
    |> preload([:location, talks: :presenter])
    |> Repo.all
  end

  @doc """
  Gets a single meetup.

  Raises `Ecto.NoResultsError` if the Meetup does not exist.

  ## Examples

      iex> get_meetup!(123)
      %Meetup{}

      iex> get_meetup!(456)
      ** (Ecto.NoResultsError)

  """
  def get_meetup!(id) do
    Meetup
    |> preload([:location, talks: :presenter])
    |> Repo.get!(id)
  end

  @doc """
  Creates a meetup.

  ## Examples

      iex> create_meetup(%{field: value})
      {:ok, %Meetup{}}

      iex> create_meetup(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_meetup(attrs \\ %{}) do

  attrs =
    attrs
    |> Map.put(:slug, Slugger.slugify_downcase(attrs.title))
    |> check_url_in_create_meetup_params()
    |> check_description_in_create_meetup_params()
    |> check_talks_in_create_meetup_params()
    |> check_date_in_create_meetup_params()
    |> check_location_in_create_meetup_params()

    %Meetup{}
    |> Meetup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a meetup.

  ## Examples

      iex> update_meetup(meetup, %{field: new_value})
      {:ok, %Meetup{}}

      iex> update_meetup(meetup, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_meetup(%Meetup{} = meetup, attrs) do
    meetup
    |> Meetup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Meetup.

  ## Examples

      iex> delete_meetup(meetup)
      {:ok, %Meetup{}}

      iex> delete_meetup(meetup)
      {:error, %Ecto.Changeset{}}

  """
  def delete_meetup(%Meetup{} = meetup) do
    Repo.delete(meetup)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking meetup changes.

  ## Examples

      iex> change_meetup(meetup)
      %Ecto.Changeset{source: %Meetup{}}

  """
  def change_meetup(%Meetup{} = meetup) do
    Meetup.changeset(meetup, %{})
  end

  defp check_url_in_create_meetup_params(attrs) do
    case Map.get(attrs, :url) do
      nil -> Map.put(attrs, :url, get_meetup_url_from_service(attrs))
      _ -> attrs
    end
  end

  defp check_description_in_create_meetup_params(attrs) do
    case Map.get(attrs, :description) do
      nil -> Map.put(attrs, :description, "Test Description")
      _ -> attrs
    end
  end

  defp check_date_in_create_meetup_params(attrs) do
    case Map.get(attrs, :date) do
      nil ->
        next_date = Timex.shift(Timex.today, months: 1)
        Map.put(attrs, :date, get_first_wednesday_of_month(next_date.year, next_date.month))
      _ -> attrs
    end
  end

  defp check_location_in_create_meetup_params(attrs) do
    case Map.get(attrs, :location) do
      nil -> Map.put(attrs, :location, get_last_location())
      _ -> attrs
    end
  end

  defp check_talks_in_create_meetup_params(attrs) do
    case Map.get(attrs, :talks) do
      nil -> Map.put(attrs, :talks, [])
      _ -> attrs
    end
  end

  defp get_last_location() do
    case next_meetup() do
      nil -> nil
      meetup -> meetup.location
      end
  end

  defp get_meetup_url_from_service(_attrs) do
    case MeetupClient.get_group_events() do
      {:ok, meetup} ->
        meetup
        |> Enum.fetch!(0)
        |> Map.get("link")
      {:error, _ } ->
        Logger.error fn ->  "#{__MODULE__} Error getting meetup's url from Meetup API" end
        "http://www.meetup.com/en-AU/sydney-ex/"
    end
  end

  defp get_first_wednesday_of_month(year, month) do
    first_day_of_month = 1
    wednesday_week_number = 3
    thursday_week_number = 4
    days_of_week = 7

    day_number = :calendar.day_of_the_week(year, month, first_day_of_month)

    wednesday =
      cond  do
        day_number > wednesday_week_number -> (days_of_week - day_number) + thursday_week_number
        day_number < wednesday_week_number -> (thursday_week_number - day_number)
        day_number == wednesday_week_number -> first_day_of_month
      end

    case Date.new(year, month, wednesday) do
      {:ok, date} -> date
      {:error, _} -> :error
    end

  end

end
