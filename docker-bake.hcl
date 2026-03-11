target "default" {
  name = "${base.image}-${replace(base.version, ".", "-")}"

  matrix = {
    base = [
      { image = "ubuntu", version = "18.04" },
      { image = "ubuntu", version = "20.04" },
      { image = "ubuntu", version = "22.04" },
      { image = "ubuntu", version = "24.04" },
    ]
  }

  tags = ["ghcr.io/open62541/open62541-ci:${base.image}-${base.version}"]

  cache-from = ["type=gha,scope=${base.image}-${base.version}"]
  cache-to   = ["type=gha,mode=max,scope=${base.image}-${base.version}"]

  dockerfile-inline = <<Dockerfile
    FROM ${base.image}:${base.version}
    ENV DEBIAN_FRONTEND=noninteractive
    RUN apt-get update -y && \
        apt-get install -y --no-install-recommends \
          sudo git build-essential cmake curl pkg-config \
          libssl-dev python3-sphinx graphviz check \
          libxml2-dev libpcap-dev libreadline-dev \
          libcap2-bin ca-certificates gnupg && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        useradd --uid 1001 ci && \
        echo 'ci ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
    USER ci
  Dockerfile
}
