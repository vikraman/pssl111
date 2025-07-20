TYPST ?= typst
TYPST_COMPILE_FLAGS ?= --features html --format html --root=${PWD}
TYPSTYLE ?= typstyle

SRCS := $(wildcard src/*.typ)
LIBS := $(wildcard lib/*.typ)
TGTS := $(patsubst src/%.typ, out/%.html, $(SRCS))

all: $(TGTS)

out/%.html: src/%.typ $(LIBS)
	@mkdir -p $(dir $@)
	$(TYPST) compile $(TYPST_COMPILE_FLAGS) $< $@

check: $(SRCS) $(LIBS)
	for file in $^; do \
		echo "Checking $$file"; \
		if ! $(TYPSTYLE) --diff $$file; then \
			echo "Formatting check failed for $$file"; \
			exit 1; \
		fi; \
	done

format: $(SRCS) $(LIBS)
	for file in $^; do \
		echo "Formatting $$file"; \
		$(TYPSTYLE) --inplace $$file; \
	done

clean:
	@rm -rfv $(TGTS)

.PHONY: all check format clean
