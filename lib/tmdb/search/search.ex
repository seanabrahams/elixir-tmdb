defmodule Tmdb.Search do
  use Tmdb.Base

  def companies(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/company?#{URI.encode_query(params)}").body
  end

  def collections(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/collection?#{URI.encode_query(params)}").body
  end

  def keywords(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/keyword?#{URI.encode_query(params)}").body
  end

  def lists(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/list?#{URI.encode_query(params)}").body
  end

  def movies(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/movie?#{URI.encode_query(params)}").body
  end

  def multi(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/multi?#{URI.encode_query(params)}").body
  end

  def persons(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/person?#{URI.encode_query(params)}").body
  end

  def tv(query, params \\ %{}) do
    params = Map.merge(params, %{"query" => query})
    get!("search/tv?#{URI.encode_query(params)}&append_to_response=videos").body
  end

end
