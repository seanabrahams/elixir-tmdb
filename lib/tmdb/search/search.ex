defmodule Tmdb.Search do
  use Tmdb.Base

  def companies(query, params \\ %{}) do
    search_api("company", query, params)
  end

  def collections(query, params \\ %{}) do
    search_api("collection", query, params)
  end

  def keywords(query, params \\ %{}) do
    search_api("keyword", query, params)
  end

  def lists(query, params \\ %{}) do
    search_api("list", query, params)
  end

  def movies(query, params \\ %{}) do
    search_api("movie", query, params)
  end

  def multi(query, params \\ %{}) do
    search_api("multi", query, params)
  end

  def persons(query, params \\ %{}) do
    search_api("person", query, params)
  end

  def tv(query, params \\ %{}) do
    search_api("tv", query, params)
  end

  defp search_api(endpoint, query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/#{endpoint}?#{URI.encode_query(params)}").body
  end
end
