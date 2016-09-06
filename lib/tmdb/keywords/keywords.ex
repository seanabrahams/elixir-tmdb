defmodule Tmdb.Keywords do
  @moduledoc """
  Keywords Endpoint

  ## Available functions for keywords

  Tmdb.Keywords.find(1721) # Find a keyword and its name by keyword id
  Tmdb.Keywords.search("fight") # Search for keywords by text
  Tmdb.Keywords.movies(1721) # find movies by a keyword ID
  """
  use Tmdb.Base

  @doc ~S"""
  Get the basic information for a specific keyword id.
    ## Required Parameters
    api_key
    ## Examples
    iex> Tmdb.Keywords.find(1721)
    %{"id" => 1721, "name" => "fight"}
  """
  def find(id) do
    get!("keyword/#{id}?").body
  end

  @doc ~S"""
  Search for keywords by text
    ## Required Parameters
    api_key
    query: CGI escaped string
    ## Optional Parameters
      page: minimum 1, maximum 1000.
    ## Examples
    iex(2)> Tmdb.Keywords.search("fight")                                       %{"page" => 1,
      "results" => [%{"id" => 1721, "name" => "fight"},
       %{"id" => 9725, "name" => "sword fight"},
       %{"id" => 5380, "name" => "virtual fight"},
       %{"id" => 14696, "name" => "bloody fight"},
       %{"id" => 14949, "name" => "stick fight"},
       %{"id" => 18109, "name" => "knife fight"},
       %{"id" => 18110, "name" => "gist fight"},
       %{"id" => 1527, "name" => "gladiator fight"},
       %{"id" => 156808, "name" => "hospital fight"},
       %{"id" => 156854, "name" => "cat fight"},
       %{"id" => 156479, "name" => "inheritance fight"},
       %{"id" => 68643, "name" => "food fight"},
       %{"id" => 157201, "name" => "women fight"},
       %{"id" => 186727, "name" => "nude fight"},
       %{"id" => 186150, "name" => "street fight"},
       %{"id" => 187928, "name" => "prison fight"},
       %{"id" => 187292, "name" => "fixed fight"},
       %{"id" => 187368, "name" => "pillow fight"},
       %{"id" => 188933, "name" => "bar fight"},
       %{"id" => 189274, "name" => "hotel fight"}], "total_pages" => 6,
      "total_results" => 109}
  """
  def movies(id) do
    get!("keyword/#{id}/movies?").body
  end
end
