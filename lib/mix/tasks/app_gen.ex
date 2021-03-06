defmodule Mix.Tasks.AppGen do
  use Mix.Task

  alias Mix.AppGenHelpers

  @shortdoc "Lists help for app_gen commands"
  @moduledoc AppGen.moduledoc()

  def run(_args) do
    AppGenHelpers.ensure_not_in_umbrella!("app_gen.gen")

    Mix.Task.run("help", ["app_gen"])
  end
end
