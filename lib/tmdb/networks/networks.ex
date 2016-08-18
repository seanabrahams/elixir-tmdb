defmodule Tmdb.Networks do
  use HTTPoison.Base

  @doc ~S"""
  Find networks by ID
    ## Required Parameters
    api_key
    ## Optional Parameters
    append_to_response:	Comma separated, any company method
    ## Examples
    iex(3)> Tmdb.Networks.find(4)
    %{"id" => 4, "name" => "BBC One"}
  """
  def find(id) do
    get!("network/#{id}?").body
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp process_url(url) do
    api_key = Application.fetch_env!(:tmdb, :api_key)
    "https://api.themoviedb.org/3/" <> url <> "&api_key=#{api_key}"
  end
end
