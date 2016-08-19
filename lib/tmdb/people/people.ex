defmodule Tmdb.People do
  use Tmdb.Base

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
end
