defmodule Tmdb.People do
  use HTTPoison.Base

  def find(id, params \\ %{}) do
    get!("person/#{id}?#{URI.encode_query(params)}").body
  end

  def popular(params \\ %{}) do
    get!("person/popular?#{URI.encode_query(params)}").body
  end

  def latest(params \\ %{}) do
    get!("person/latest?#{URI.encode_query(params)}").body
  end

  def search(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/person?#{URI.encode_query(params)}").body
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
