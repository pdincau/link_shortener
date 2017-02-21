defmodule LinkShortener do
  use Application
  use HTTPoison.Base

  def start(_type, _args) do
    LinkShortener.Supervisor.start_link
  end

  def process_url(fields) do
    url = "https://www.googleapis.com/urlshortener/v1/url?fields=" <> fields <> "&key=" <> key()
    url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp process_request_headers(headers) do
    [{"Content-Type", "application/json"}]
  end

  defp key do
    Application.get_env(:link_shortener, :api_key)
  end
end
