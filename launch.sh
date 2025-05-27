DEBIAN_FRONTEND=noninteractive apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install sudo --no-install-recommends --yes
DEBIAN_FRONTEND=noninteractive apt-get install wget --no-install-recommends --yes
DEBIAN_FRONTEND=noninteractive apt-get install ca-certificates --no-install-recommends --yes
DEBIAN_FRONTEND=noninteractive apt-get install iptables --no-install-recommends --yes
DEBIAN_FRONTEND=noninteractive apt-get install qemu-utils --no-install-recommends --yes
DEBIAN_FRONTEND=noninteractive apt-get install p7zip-full --no-install-recommends --yes
DEBIAN_FRONTEND=noninteractive apt-get install openssh-server --no-install-recommends --yes
DEBIAN_FRONTEND=noninteractive apt-get install htop --no-install-recommends --yes
DEBIAN_FRONTEND=noninteractive apt-get install ethtool --no-install-recommends --yes

# https://www.speedtest.net/apps/cli
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/speedtest --output-document /usr/local/bin/speedtest
chmod +x /usr/local/bin/speedtest

# https://github.com/fastfetch-cli/fastfetch/actions/workflows/ci.yml?query=event%3Apush+is%3Asuccess+branch%3Adev
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/fastfetch --output-document /usr/local/bin/fastfetch
chmod +x /usr/local/bin/fastfetch

# https://pkgs.tailscale.com/unstable
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/tailscale --output-document /usr/local/bin/tailscale
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/tailscaled --output-document /usr/local/bin/tailscaled
chmod +x /usr/local/bin/tailscale
chmod +x /usr/local/bin/tailscaled

# https://github.com/moby/moby/actions/workflows/buildkit.yml?query=event%3Apush+is%3Asuccess+branch%3Amaster
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/docker-proxy --output-document /usr/local/bin/docker-proxy
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/dockerd --output-document /usr/local/bin/dockerd
chmod +x /usr/local/bin/docker-proxy
chmod +x /usr/local/bin/dockerd

# https://github.com/docker/cli/actions/workflows/build.yml?query=event%3Apush+is%3Asuccess+branch%3Amaster
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/docker-linux-amd64 --output-document /usr/local/bin/docker
chmod +x /usr/local/bin/docker

# https://github.com/containerd/containerd/actions/workflows/release.yml?query=event%3Apush+is%3Asuccess+branch%3Amain
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/containerd-shim-runc-v2 --output-document /usr/local/bin/containerd-shim-runc-v2
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/containerd --output-document /usr/local/bin/containerd
chmod +x /usr/local/bin/containerd-shim-runc-v2
chmod +x /usr/local/bin/containerd

# https://github.com/opencontainers/runc/actions/workflows/validate.yml?query=event%3Apush+is%3Asuccess+branch%3Amain
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/runc.amd64 --output-document /usr/local/bin/runc
chmod +x /usr/local/bin/runc

# https://github.com/docker/compose/actions/workflows/ci.yml?query=event%3Apush+is%3Asuccess+branch%3Amain
mkdir --parents /usr/local/lib/docker/cli-plugins
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/docker-compose-linux-x86_64 --output-document /usr/local/lib/docker/cli-plugins/docker-compose
chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# https://github.com/docker/buildx/actions/workflows/build.yml?query=event%3Apush+is%3Asuccess+branch%3Amaster
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/buildx.linux-amd64 --output-document /usr/local/lib/docker/cli-plugins/docker-buildx
chmod +x /usr/local/lib/docker/cli-plugins/docker-buildx

# https://github.com/cli/cli/releases/latest
wget https://github.com/ItzLevvie/artifacts/releases/latest/download/gh --output-document /usr/local/bin/gh
chmod +x /usr/local/bin/gh

dockerd --seccomp-profile unconfined --experimental &> /dev/null &

mkdir ~/windows
wget https://github.com/ItzLevvie/artifacts/releases/download/27774-2/data.7z.001 --output-document ~/windows/data.7z.001
wget https://github.com/ItzLevvie/artifacts/releases/download/27774-2/data.7z.002 --output-document ~/windows/data.7z.002
wget https://github.com/ItzLevvie/artifacts/releases/download/27774-2/data.7z.003 --output-document ~/windows/data.7z.003
wget https://github.com/ItzLevvie/artifacts/releases/download/27774-2/data.7z.004 --output-document ~/windows/data.7z.004

7z x ~/windows/data.7z.001 -o~/windows
rm --force ~/windows/data.7z.00*
qemu-img convert -p -O raw -o preallocation=off ~/windows/data.vhdx ~/windows/data.img
rm --force ~/windows/data.vhdx
cp ~/windows/data.img ~/windows/data.img.bak

{
    echo "data.img"
} > ~/windows/windows.boot
