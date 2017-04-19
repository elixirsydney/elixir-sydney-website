defmodule ElixirSydney.Events do
  @moduledoc """
  The boundary for the Events system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias ElixirSydney.Repo

  alias ElixirSydney.Events.Meetup

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

  def all_meetups do
    Meetup
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
  def list_meetups do
    Repo.all(Meetup)
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
  def get_meetup!(id), do: Repo.get!(Meetup, id)

  @doc """
  Creates a meetup.

  ## Examples

      iex> create_meetup(%{field: value})
      {:ok, %Meetup{}}

      iex> create_meetup(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_meetup(attrs \\ %{}) do
    %Meetup{}
    |> meetup_changeset(attrs)
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
    |> meetup_changeset(attrs)
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
    meetup_changeset(meetup, %{})
  end

  defp meetup_changeset(%Meetup{} = meetup, attrs) do
    meetup
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
