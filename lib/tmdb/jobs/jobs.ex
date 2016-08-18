defmodule Tmdb.Jobs do
  @moduledoc """
  Jobs Endpoint
    Get information about jobs, only Tmdb.Jobs.list available for now.
  """
  use HTTPoison.Base

  @doc """
  Get a list of valid jobs.
    ## Required Parameters
    api_key
    ## Examples
    iex(1)> Tmdb.Jobs.list
    %{"jobs" => [%{"department" => "Writing",
         "job_list" => ["Screenplay", "Author", "Novel", "Characters",
          "Theatre Play", "Adaptation", "Dialogue", "Writer", "Other", "Storyboard",
          "Original Story", "Scenario Writer", "Screenstory", "Musical", "Idea",
          "Story", "Creative Producer", "Teleplay", "Opera", "Co-Writer", "Book",
          "Comic Book", "Short Story", "Series Composition", "Script Editor"]},
       %{"department" => "Directing",
         "job_list" => ["Director", "Script Supervisor", "Other", "Layout",
          "Script Coordinator", "Special Guest Director", "Assistant Director"]},
       %{"department" => "Actors",
         "job_list" => ["Actor", "Stunt Double", "Voice", "Cameo",
          "Special Guest"]}]}
        ...
  """
  def list do
    get!("job/list?").body
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
