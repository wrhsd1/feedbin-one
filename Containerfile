FROM ghcr.io/wrhsd1/systemd-podman:main

RUN podman exec --user=0 pull docker.io/library/caddy:2-alpine \
 && podman exec --user=0 pull docker.io/library/elasticsearch:8.2.0 \
 && podman exec --user=0 pull docker.io/library/memcached:1-alpine \
 && podman exec --user=0 pull docker.io/library/postgres:14-alpine \
 && podman exec --user=0 pull docker.io/library/redis:6-alpine \
 && podman exec --user=0 pull docker.io/minio/mc:latest \
 && podman exec --user=0 pull docker.io/minio/minio:latest \
 && podman exec --user=0 pull docker.io/wrhsd/feedbin-one:20220509 \
 && rm -rf /usr/share/containers/storage \
 && mv /var/lib/containers/storage /usr/share/containers/storage

ADD etc /etc
ADD usr /usr

VOLUME ["/data"]
