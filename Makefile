PROTO_DIR=user
OUT_DIR=.

PROTOC_GEN_GO=$(shell which protoc-gen-go)
PROTOC_GEN_GO_GRPC=$(shell which protoc-gen-go-grpc)

.PHONY: all
all: user

.PHONY: user
user:
	@protoc --go_out=$(OUT_DIR) --go_opt=paths=source_relative \
	        --go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative \
	        user/user.proto
	@echo "✅ Generated gRPC code for user.proto"

.PHONY: clean
clean:
	@rm -f **/*.pb.go
