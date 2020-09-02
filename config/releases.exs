import Config

name = "ejb"

config :libcluster,
  topologies: [
    nook_book: [
      strategy: Cluster.Strategy.Empd,
      config: [
        hosts: [
          :"nook_book@10.0.1.5",
          :"nook_book@10.0.1.125"
        ]
      ]
    ]
  ]

config :nook_book, cluster_role: System.get_env("CLUSTER_ROLE", "member") |> String.to_atom()

config :nook_book, NookBookWeb.Endpoint,
  server: true,
  http: [port: 4000],
  url: [host: "#{name}.nookbook.online"],
  secret_key_base: "pbHD1YpDeMBnt28fSGN1hwKZkUe7kRrlFoLZwdG3gBOUO0Vso1U3kzclW1qJFG+t"
