defmodule Tmdb.Movies do
  use Tmdb.Base

  def find(id) do
    get!("movie/#{id}?append_to_response=trailers").body
  end

  def genres do
    get!("genre/movie/list?").body
  end

  def images(id, params \\ %{}) do
    get!("movie/#{id}/images?#{URI.encode_query(params)}").body
  end

  def latest(params \\ %{}) do
    get!("movie/latest?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def now_playing(params \\ %{}) do
    get!("movie/now_playing?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def popular(params \\ %{}) do
    get!("movie/popular?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def similar(id, params \\ %{}) do
    get!("movie/#{id}/similar?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def top(params \\ %{}) do
    get!("movie/top_rated?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def upcoming(params \\ %{}) do
    get!("movie/upcoming?#{URI.encode_query(params)}&append_to_response=videos").body
  end

  def videos(id, params \\ %{}) do
    get!("movie/#{id}/videos?#{URI.encode_query(params)}").body
  end
end
