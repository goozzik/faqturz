use Mix.Config

config :faqturz, IfirmaApiClient,
  username: System.get_env("IFIRMA_USERNAME"),
  auth_key: System.get_env("IFIRMA_AUTH_KEY")
