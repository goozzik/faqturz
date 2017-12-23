use Mix.Config

config :faqturz, IfirmaApiClient,
  username: "test@example.com",
  auth_key: "EAB0D8ACF3308F3B"

config :exvcr, [
  filter_request_headers: ["Authentication"]
]
