# Contributing to GNU Make

## Project Shape

- The main implementation is portable C in `src/`; shared portability helpers are in `lib/`.
- Platform-specific code and build paths are kept under `src/w32/`, `src/vms*`, and the system-specific README files.
- The build uses Autoconf, Automake, and Gnulib. `configure.ac` and `Makefile.am` define the generated build system.
- The regression suite is in `tests/`; individual behavior tests are under `tests/scripts/`.

## Build And Test

- For a Git checkout on POSIX, run `./bootstrap`, then `./configure`, then `make check`.
- Git checkouts must be built in the source directory; VPATH builds are supported only from a distribution tree.
- Run a focused regression suite with `cd tests && ./run_make_tests -make ../make`.
- The test suite requires Perl and writes failures and diagnostic files under `tests/work`; it is not parallelizable.
- Useful maintained checks include `make check-alt-config`, `make check-loadavg`, and the Valgrind/ASAN workflows documented in [README.git](README.git).
- When the system does not have a working `make`, `sh build.sh` can bootstrap the program after configuration.

## Change Guidance

- Follow the GNU Coding Standards and use spaces, not tabs, in C source code. Preserve tabs where Makefile syntax requires recipe indentation.
- Add or update regression coverage in `tests/scripts/` for behavior changes; use nearby tests as the template.
- Do not hand-edit generated files. Regenerate Git-checkout artifacts with `./bootstrap --gen` or rebuild generated files through the configured build as appropriate.
- Keep changes portable across POSIX and supported non-POSIX ports. Consult [README.W32](README.W32), [README.VMS](README.VMS), [README.zOS](README.zOS), or [README.DOS](README.DOS) when touching platform-specific code.
- Maintainer-mode builds enable strict warnings and `-Werror`; diagnose warnings rather than weakening them unless the change specifically requires it.
- Avoid running tests in parallel or reusing a dirty `tests/work` directory when investigating failures. Networked filesystems can cause flaky tests; use `tests/mkshadow` to run from a local temporary directory.

## Key References

- [README.in](README.in): build, test, platform, and contribution overview.
- [README.git](README.git): Git checkout prerequisites, bootstrap details, and debugging workflows.
- [tests/README](tests/README): regression-suite requirements, options, and failure artifacts.
- [doc/make.texi](doc/make.texi): user-facing manual and behavior reference.
- [Makefile.am](Makefile.am) and [maintMakefile](maintMakefile): build layout and maintainer-only rules.

Before submitting a change, review `git diff`, run the narrowest relevant test, and run `make check` when the build and environment permit it.
