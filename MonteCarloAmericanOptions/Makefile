ifndef MKLROOT
$(error MKLROOT is not set. Please source the Intel oneAPI environment or export MKLROOT before building.)
endif

CXX ?= icx
CXXFLAGS ?= -std=c++14 -O3 -g -fopenmp
CPPFLAGS ?= -I$(MKLROOT)/include

MKL_LIBS ?= -L$(MKLROOT)/lib/intel64 \
            -Wl,--start-group -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -Wl,--end-group \
            -lpthread -lm -ldl

TARGET ?= amc
SOURCES := main.cpp utilities.cpp

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ -o $@ $(MKL_LIBS)

clean:
	rm -f $(TARGET)

.PHONY: all clean
