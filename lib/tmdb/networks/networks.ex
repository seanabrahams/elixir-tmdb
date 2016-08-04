defmodule Tmdb.Networks do
  use HTTPoison.Base

  @doc ~S"""
  Find networks by ID
    ## Required Parameters
    api_key
    ## Optional Parameters
    append_to_response:	Comma separated, any company method

    ## Examples

    iex> Tmdb.Companies.find(420)
    %{"description" => nil, "headquarters" => nil, "homepage" => nil, "id" => 420,
      "logo_path" => "/x1ynrDnk4RgbsnMI9yrdcdEm6Fu.png", "name" => "Marvel Studios",
      "parent_company" => nil}
 """
  def find(id) do
    get!("network/#{id}?").body
  end

  def tv(id) do
    get!("discover/tv?with_networks=#{id}").body
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
