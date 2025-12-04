NEEDS_MKL_TARGETS := all AsianOptionsPricing MonteCarloEuropeanOptions BinomialOptions BlackScholes LiborMarketModel MonteCarloAmericanOptions
REQUESTED_GOALS := $(if $(strip $(MAKECMDGOALS)),$(MAKECMDGOALS),all)

ifneq ($(filter $(NEEDS_MKL_TARGETS),$(REQUESTED_GOALS)),)
ifndef MKLROOT
$(error MKLROOT is not set. Please source the Intel oneAPI environment or export MKLROOT before building.)
endif
endif

BENCHMARKS := AsianOptionsPricing \
              MonteCarloEuropeanOptions \
              BinomialOptions \
              BlackScholes \
              LiborMarketModel \
              MonteCarloAmericanOptions

.PHONY: all clean $(BENCHMARKS) $(addprefix clean-,$(BENCHMARKS))

all: $(BENCHMARKS)

$(BENCHMARKS):
	$(MAKE) -C $@

clean: $(addprefix clean-,$(BENCHMARKS))

clean-%:
	$(MAKE) -C $* clean

help:
	@echo "Available targets:"
	@echo "  make all        - build every benchmark"
	@echo "  make <name>     - build a specific benchmark directory (one of $(BENCHMARKS))"
	@echo "  make clean      - clean all benchmarks"
	@echo "  make clean-<name> - clean a single benchmark directory"

.PHONY: help
