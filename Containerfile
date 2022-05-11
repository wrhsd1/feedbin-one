FROM ghcr.io/wrhsd1/systemd-podman:main

RUN apt install sudo 、
 && sudo podman pull docker.io/library/caddy:2-alpine \
 && sudo podman pull docker.io/library/elasticsearch:8.2.0 \
 && sudo podman pull docker.io/library/memcached:1-alpine \
 && sudo podman pull docker.io/library/postgres:14-alpine \
 && sudo podman pull docker.io/library/redis:6-alpine \
 && sudo podman pull docker.io/minio/mc:latest \
 && sudo podman pull docker.io/minio/minio:latest \
 && sudo podman pull docker.io/wrhsd/feedbin-one:20220509 \
 && sudo rm -rf /usr/share/containers/storage \
 && sudo mv /var/lib/containers/storage /usr/share/containers/storage

ADD etc /etc
ADD usr /usr

VOLUME ["/data"]
