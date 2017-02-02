# Copyright 2016 The Cockroach Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied. See the License for the specific language governing
# permissions and limitations under the License. See the AUTHORS file
# for names of contributors.
#
# Author: Nathan VanBenschoten (nvanbenschoten@gmail.com)

GO ?= go

.PHONY: all
all: test

ifneq ($(COCKROACH_BINARY),)
BINARYFLAG = -cockroach-binary=$(COCKROACH_BINARY)
endif

.PHONY: test
test:
	$(GO) test -v -i ./testing
	$(GO) test -v ./testing $(BINARYFLAG)

.PHONY: deps
deps:
	$(GO) get -d -t ./...
	$(MAKE) deps -C ./java/hibernate
