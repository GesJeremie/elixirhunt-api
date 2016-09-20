defmodule Elixirhunt.Admin.SessionView do
  use Elixirhunt.Web, :view

  def render("connected.json", %{}) do
    %{
      connected: true
    }  
  end

  def render("not_connected.json", %{}) do
    %{
      connected: false
    }
  end

  def render("success.json", %{message: message}) do
    %{
      success: true,
      message: message
    }
  end

  def render("error.json", %{message: message}) do
    %{
      success: false,
      message: message
    }
  end

end
