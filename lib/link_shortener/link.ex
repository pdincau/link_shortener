defmodule LinkShortener.Links do

  def shorten(url) do
    params = %{longUrl: url}
    LinkShortener.post!("id", Poison.encode!(params)).body
  end

end
