job "http-echo-1" {
  datacenters = ["us-east-1b", "us-east-1d", "us-east-1e", "dc1"]
  type        = "service"

  update {
    max_parallel = 1
  }

  group "web1" {
    count = ${this_count}
    constraint {
      distinct_hosts = true
    }

    restart {
      attempts = 10
      interval = "5m"
      delay    = "25s"
      mode     = "delay"
    }

    task "http-echo-1" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo:latest"

        args = [
          "-text",
          "'hello world 111111111 AWS'",
          "-listen",
          ":8080",
        ]

        port_map {
          http = 8080
        }
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB

        network {
          mbits = 10

          port "http" {
            static = 8080
          }
        }
      }

      service {
        name = "http-echo-1"

        port = "http"

        check {
          name     = "alive"
          type     = "http"
          interval = "10s"
          timeout  = "2s"
          path     = "/"
        }
      }
    }
  }
}
