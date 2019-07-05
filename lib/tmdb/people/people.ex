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

  def movie_credits(id, params \\ %{}) do
    get!("person/#{id}/movie_credits?#{URI.encode_query(params)}").body
  end

  def tv_credits(id, params \\ %{}) do
    get!("person/#{id}/tv_credits?#{URI.encode_query(params)}").body
  end

  def combined_credits(id, params \\ %{}) do
    get!("person/#{id}/combined_credits?#{URI.encode_query(params)}").body
  end

  def external_ids(id, params \\ %{}) do
    get!("person/#{id}/external_ids?#{URI.encode_query(params)}").body
  end

  def images(id, params \\ %{}) do
    get!("person/#{id}/images?#{URI.encode_query(params)}").body
  end

  def tagged_images(id, params \\ %{}) do
    get!("person/#{id}/tagged_images?#{URI.encode_query(params)}").body
  end

  def translations(id, params \\ %{}) do
    get!("person/#{id}/translations?#{URI.encode_query(params)}").body
  end
end
