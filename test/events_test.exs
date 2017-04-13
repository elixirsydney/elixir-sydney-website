defmodule ElixirSydney.EventsTest do
  use ElixirSydney.DataCase

  alias ElixirSydney.Events
  alias ElixirSydney.Events.Meetup

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  def fixture(:meetup, attrs \\ @create_attrs) do
    {:ok, meetup} = Events.create_meetup(attrs)
    meetup
  end

  test "list_meetups/1 returns all meetups" do
    meetup = fixture(:meetup)
    assert Events.list_meetups() == [meetup]
  end

  test "get_meetup! returns the meetup with given id" do
    meetup = fixture(:meetup)
    assert Events.get_meetup!(meetup.id) == meetup
  end

  test "create_meetup/1 with valid data creates a meetup" do
    assert {:ok, %Meetup{} = meetup} = Events.create_meetup(@create_attrs)
    assert meetup.title == "some title"
  end

  test "create_meetup/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Events.create_meetup(@invalid_attrs)
  end

  test "update_meetup/2 with valid data updates the meetup" do
    meetup = fixture(:meetup)
    assert {:ok, meetup} = Events.update_meetup(meetup, @update_attrs)
    assert %Meetup{} = meetup
    assert meetup.title == "some updated title"
  end

  test "update_meetup/2 with invalid data returns error changeset" do
    meetup = fixture(:meetup)
    assert {:error, %Ecto.Changeset{}} = Events.update_meetup(meetup, @invalid_attrs)
    assert meetup == Events.get_meetup!(meetup.id)
  end

  test "delete_meetup/1 deletes the meetup" do
    meetup = fixture(:meetup)
    assert {:ok, %Meetup{}} = Events.delete_meetup(meetup)
    assert_raise Ecto.NoResultsError, fn -> Events.get_meetup!(meetup.id) end
  end

  test "change_meetup/1 returns a meetup changeset" do
    meetup = fixture(:meetup)
    assert %Ecto.Changeset{} = Events.change_meetup(meetup)
  end
end
