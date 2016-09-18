defmodule Mix.Tasks.Deploy do
  use Mix.Task

  def run(_args) do
    
    show("Building release ...")
    Mix.Task.run("edeliver", ["build release --branch=master --verbose"])

    show("Deploy to production ...")
    Mix.Task.reenable("edeliver")
    Mix.Task.run("edeliver", ["deploy release to production --verbose"])

    show("Migrate app production ...")
    Mix.Task.reenable("edeliver")
    Mix.Task.run("edeliver", ["migrate production"])

    show("Restart app production ...")
    Mix.Task.reenable("edeliver")
    Mix.Task.run("edeliver", ["restart production"])
  end


  def show(message) do
    [:green, :bright, message]
    |> IO.ANSI.format
    |> IO.puts
  end
end
