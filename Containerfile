FROM ghcr.io/wrhsd1/systemd-podman:main

RUN podman pull docker.io/library/caddy:2-alpine \
 && podman pull docker.io/library/elasticsearch:8.2.0 \
 && podman pull docker.io/library/memcached:1-alpine \
 && podman pull docker.io/library/postgres:14-alpine \
 && podman pull docker.io/library/redis:6-alpine \
 && podman pull docker.io/minio/mc:latest \
 && podman pull docker.io/minio/minio:latest \
 && podman pull docker.io/wrhsd/feedbin-one:20220509 \
 && podman system migrate
 && sudo rm -rf /usr/share/containers/storage \
 && sudo mv /var/lib/containers/storage /usr/share/containers/storage

ADD etc /etc
ADD usr /usr

VOLUME ["/data"]
