# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Elixirhunt.Repo.insert!(%Elixirhunt.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Fixtures do
  def post do
    Elixirhunt.Repo.insert! %Elixirhunt.Post{
      title: FakerElixir.Lorem.words,
      company: FakerElixir.App.name,
      location: FakerElixir.Address.city,
      content: FakerElixir.Lorem.sentences(3),
      logo: FakerElixir.Avatar.robohash,
      url: FakerElixir.Internet.url
    }
  end  
end


posts = Stream.repeatedly(fn -> Fixtures.post end)
posts |> Enum.take(400)