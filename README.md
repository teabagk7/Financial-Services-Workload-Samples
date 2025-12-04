DISCONTINUATION OF PROJECT

This project will no longer be maintained by Intel.

Intel has ceased development and contributions including, but not limited to, maintenance, bug fixes, new releases, or updates, to this project.

Intel no longer accepts patches to this project.

If you have an ongoing need to use this project, are interested in independently developing it, or would like to maintain patches for the open source software community, please create your own fork of this project.

Contact: webadmin@linux.intel.com

## Building the benchmarks

Each benchmark lives in its own subdirectory (e.g., `AsianOptionsPricing`, `BlackScholes`, etc.) and can be built individually or all at once via the root `Makefile`.

1. Install the Intel oneAPI toolchain (or a compatible MKL distribution) and source the environment so `icx`, MKL, and TBB are on your path:
	```bash
	source /opt/intel/oneapi/setvars.sh
	```
2. Confirm `MKLROOT` is set. This is required by all sub-Makefiles.
3. From the repository root, build everything:
	```bash
	make
	```
	or build a single workload:
	```bash
	make BlackScholes
	```
4. Clean the outputs with:
	```bash
	make clean
	```

The top-level `Makefile` simply forwards to each benchmark's local `Makefile`, so you can also `cd` into a subdirectory and run `make` there if you prefer.
