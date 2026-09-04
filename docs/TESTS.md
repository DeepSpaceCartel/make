# Test Failure Tasks

The raw `make check` output is preserved in [tests.log](tests.log). The run completed compilation and most regression categories, but 20 tests failed. All tasks below are currently `not started`.

## 1. Fix `features/double_colon/t004`

- Current failure: The `features/double_colon` category reported 15 of 18 tests passed; `t004` is one of the three failures.
- Current state: `not started`.
- Troubleshooting notes: Inspect `tests/work/features/double_colon/t004.run`, `t004.base`, and `t004.diff`. Compare the generated makefile and output with the test script and verify whether the difference is caused by environment, ordering, or double-colon rule behavior.

## 2. Fix `features/double_colon/t013`

- Current failure: The `features/double_colon` category reported 15 of 18 tests passed; `t013` failed.
- Current state: `not started`.
- Troubleshooting notes: Start with `tests/work/features/double_colon/t013.diff` and trace the corresponding test in `tests/scripts/features/double_colon`. Re-run only this test after identifying the expected rule execution order.

## 3. Fix `features/double_colon/t018`

- Current failure: The `features/double_colon` category reported 15 of 18 tests passed; `t018` failed.
- Current state: `not started`.
- Troubleshooting notes: Compare `t018.run` with `t018.base` and check whether timestamps or repeated double-colon recipes affect the result. Confirm the behavior on a clean `tests/work` directory.

## 4. Fix `features/parallelism/t006`

- Current failure: The `features/parallelism` category reported 11 of 13 tests passed; `t006` failed.
- Current state: `not started`.
- Troubleshooting notes: Inspect the diff for nondeterministic output or job scheduling assumptions. Re-run with the test harness and compare serial execution against the test's intended parallel mode.

## 5. Fix `features/parallelism/t007`

- Current failure: The `features/parallelism` category reported 11 of 13 tests passed; `t007` failed.
- Current state: `not started`.
- Troubleshooting notes: Check `tests/work/features/parallelism/t007.diff` for ordering-sensitive output. Verify CPU/jobserver conditions and avoid running the suite concurrently while reproducing it.

## 6. Fix `options/dash-l/t001`

- Current failure: The `options/dash-l` category reported 0 of 1 tests passed; `t001` failed.
- Current state: `not started`.
- Troubleshooting notes: Inspect the saved run, expected output, and diff under `tests/work/options/dash-l/`. Check the host load-average implementation and the test's `-l` threshold assumptions before changing behavior.

## 7. Fix `targets/WAIT/t004`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t004` failed.
- Current state: `not started`.
- Troubleshooting notes: Inspect `tests/work/targets/WAIT/t004.diff` and the corresponding script. Reproduce with the exact `-j` setting used by the test and check whether the failure is a scheduling or ordering issue.

## 8. Fix `targets/WAIT/t006`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t006` failed.
- Current state: `not started`.
- Troubleshooting notes: Compare the saved run and baseline, then inspect the `.WAIT` dependency graph in the source test. Keep the test harness isolated and rerun only this case.

## 9. Fix `targets/WAIT/t007`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t007` failed.
- Current state: `not started`.
- Troubleshooting notes: Use the generated diff to identify whether prerequisites started too early or output was reordered. Validate the result with a clean work directory and the same parallel job count.

## 10. Fix `targets/WAIT/t008`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t008` failed.
- Current state: `not started`.
- Troubleshooting notes: Trace the test's `.WAIT` placement and recipe completion markers. Compare serial and parallel runs to isolate scheduling behavior from test-environment noise.

## 11. Fix `targets/WAIT/t013`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t013` failed. The raw run also showed a related `-j10` invocation returning status 512.
- Current state: `not started`.
- Troubleshooting notes: Inspect both the category diff and the raw command output in [tests.log](tests.log). Reproduce the exact `pre1 .WAIT pre2 pre3` style invocation if present and determine whether the nonzero status is from make or a test recipe.

## 12. Fix `targets/WAIT/t014`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t014` failed. A related raw `-j10` test invocation returned status 512.
- Current state: `not started`.
- Troubleshooting notes: Review the saved `.run`, `.base`, and `.diff` files and inspect the test recipe's synchronization markers. Confirm whether the failure reproduces outside a shared or networked filesystem.

## 13. Fix `targets/WAIT/t015`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t015` failed. The raw output included a `-j10` invocation returning status 512.
- Current state: `not started`.
- Troubleshooting notes: Compare the expected ordering around `.WAIT` with the actual recipe output. Re-run in isolation, then use the smallest source or test change that explains the ordering difference.

## 14. Fix `targets/WAIT/t016`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t016` failed.
- Current state: `not started`.
- Troubleshooting notes: Inspect the category's generated artifacts and identify the first divergent event. Check jobserver propagation and parallel recipe completion before changing `.WAIT` implementation code.

## 15. Fix `targets/WAIT/t018`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t018` failed.
- Current state: `not started`.
- Troubleshooting notes: Read the test definition and compare the recorded execution trace with its baseline. Re-run with the same `-j` value and verify that temporary files are not being shared with another test run.

## 16. Fix `targets/WAIT/t019`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t019` failed.
- Current state: `not started`.
- Troubleshooting notes: Inspect the diff for a dependency release occurring before `.WAIT`. Confirm the test's assumptions about recipe output and process completion under parallel execution.

## 17. Fix `targets/WAIT/t020`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t020` failed.
- Current state: `not started`.
- Troubleshooting notes: Compare `t020.run` with the baseline and trace each prerequisite and barrier. Reproduce after clearing `tests/work`, without parallel test-suite execution.

## 18. Fix `targets/WAIT/t021`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t021` failed.
- Current state: `not started`.
- Troubleshooting notes: Check for timing-sensitive assertions and output buffering in the test. Use the test harness's isolated run and retain the generated artifacts while diagnosing.

## 19. Fix `targets/WAIT/t022`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t022` failed.
- Current state: `not started`.
- Troubleshooting notes: Inspect the test's dependency graph and the first mismatch in its diff. Determine whether the result changes with a different `-j` value or only under the current container environment.

## 20. Fix `targets/WAIT/t023`

- Current failure: The `targets/WAIT` category reported 22 of 36 tests passed; `t023` failed.
- Current state: `not started`.
- Troubleshooting notes: Review the saved artifacts and the corresponding `.WAIT` scenario in `tests/scripts/targets/WAIT`. Confirm the failure on a clean local filesystem before modifying implementation or expected output.
