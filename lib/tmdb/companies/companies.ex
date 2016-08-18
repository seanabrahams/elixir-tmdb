defmodule Tmdb.Companies do
  use HTTPoison.Base

  @doc ~S"""
  Find companies by ID
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
    get!("company/#{id}?").body
  end

  @doc ~S"""
  Search for companies by name.
    ## Required Parameters
    api_key
    query:	CGI escaped string
    ## Optional Parameters
    page:	Minimum 1, maximum 1000.
    ## Examples
    iex> Tmdb.Search.collection("Star")
    %{"page" => 1,
      "results" => [
      %{"id" => 8034, "logo_path" => nil, "name" => "Starz!"},
      %{"id" => 2885, "logo_path" => nil, "name" => "Starz Animation"},
       %{"id" => 2659, "logo_path" => nil, "name" => "Starz Media"}
       ], "total_pages" => 1,
      "total_results" => 3}
  """
  def search(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/company?#{URI.encode_query(params)}").body
  end

  def movies(id) do
    get!("company/#{id}/movies?").body
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
