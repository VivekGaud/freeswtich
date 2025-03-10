IMAGE_NAME = custom-freeswitch
CONTAINER_NAME = freeswitch

# Port mappings
SIP_UDP_PORT = 5060
SIP_TLS_PORT = 5061
# RTP_RANGE = 16384-32768

.PHONY: rebuild

rebuild:
	@echo "Removing existing container (if any)..."
	-docker rm -f $(CONTAINER_NAME)
	@echo "Building Docker image '$(IMAGE_NAME)'..."
	docker build -t $(IMAGE_NAME) .
	@echo "Running container '$(CONTAINER_NAME)'..."
	docker run --net=host -d \
	  --name $(CONTAINER_NAME) \
	  -p $(SIP_UDP_PORT):$(SIP_UDP_PORT)/udp \
	  -p $(SIP_TLS_PORT):$(SIP_TLS_PORT)/tcp \
	  $(IMAGE_NAME)