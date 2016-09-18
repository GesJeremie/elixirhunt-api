defmodule Elixirhunt.IftttController do
  use Elixirhunt.Web, :controller

  @doc """
  Layer to call the maker API of Ifttt
  """
  def maker(conn, params = %{"event" => event}) do
    
    key = Application.get_env(:api, :ifttt_key)

    request = "https://maker.ifttt.com/trigger/#{event}/with/key/#{key}"

    HTTPoison.get request, [], params: [
      value1: params["value1"], 
      value2: params["value2"],
      value3: params["value3"]
    ]
    
    send_resp(conn, :no_content, "")
  end

end