defmodule Tmdb.Keywords do
  use HTTPoison.Base

  def find(id) do
    get!("keyword/#{id}?").body
  end

  def search(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/keyword?#{URI.encode_query(params)}").body
  end

  def movies(id) do
    get!("keyword/#{id}/movies?").body
  end
  def movies_language(id, language) do
    get!("keyword/#{id}/movies?language=#{language}").body
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
