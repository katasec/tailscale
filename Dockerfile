# ------------------------------------------------------------------------------------------
# Start from TailScale container.
# ------------------------------------------------------------------------------------------
FROM tailscale/tailscale:v1.40 as build
COPY scripts/tailscale.sh /tmp

# ------------------------------------------------------------------------------------------
# Copy tailscale to alpine bash to customize startup
# ------------------------------------------------------------------------------------------
FROM bash:5.1.16-alpine3.15
COPY --from=build /usr/local/bin/tailscale /usr/local/bin/tailscale
COPY --from=build /usr/local/bin/tailscaled /usr/local/bin/tailscaled
COPY --from=build /tmp/tailscale.sh /usr/local/bin/tailscale.sh
# COPY --from=build /go/src/app/scripts/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]