

build:
	docker build . -t ghcr.io/katasec/tailscale:0.03
push:
	docker push ghcr.io/katasec/tailscale:0.03
run:
	docker run -e KEY="$$TF_VAR_TAILSCALE_AUTHKEY" -d ghcr.io/katasec/tailscale:0.01 tailscale.sh