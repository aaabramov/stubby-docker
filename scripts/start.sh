#!/bin/bash

echo "Using stubby v$(stubby -v)"

stubby \
	-d ${STUB_DATA:-/scripts/example.yaml} \
	-a ${ADMIN_PORT:-8889} 				   \
	-s ${STUB_PORT:-8882}  			       \
	-w