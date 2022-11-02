defmodule Fakes.Api.Base do
  @doc """
  Wraps body reponse in HTTPoison response
  """
  @spec ok_http_response(any(), List.t()) :: {:ok, HTTPoison.Response.t()}
  def ok_http_response(body, opts \\ []) do
    method = Keyword.get(opts, :method, :get)
    endpoint = Keyword.get(opts, :endpoint, "api/v3/endpoint")
    status_code = Keyword.get(opts, :status_code, 200)

    {:ok,
     %HTTPoison.Response{
       body: body,
       headers: [
         {"Date", "Sun, 31 Oct 2022 11:11:11 GMT"},
         {"Content-Type", "application/json;charset=UTF-8"},
         {"Transfer-Encoding", "chunked"},
         {"Connection", "keep-alive"},
         {"Server", "nginx/1.14.0 (Ubuntu)"},
         {"Vary", "Accept-Encoding"},
         {"Access-Control-Allow-Origin", "*"},
         {"Access-Control-Allow-Methods", "GET, OPTIONS"},
         {"Access-Control-Max-Age", "3600"},
         {"Access-Control-Allow-Headers",
          "origin, content-type, accept, Authorization, authorization"},
         {"X-Frame-Options", "SAMEORIGIN"}
       ],
       request: %HTTPoison.Request{
         body: "",
         headers: [],
         method: method,
         options: [],
         params: %{},
         url: "https://financialmodelingprep.com/#{endpoint}"
       },
       request_url: "https://financialmodelingprep.com/#{endpoint}",
       status_code: status_code
     }}
  end
end
