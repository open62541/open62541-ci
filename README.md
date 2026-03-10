# open62541-ci

Docker images used by the [open62541](https://github.com/open62541/open62541) CI/CD pipelines.

Images are automatically built and pushed to `ghcr.io/open62541/open62541-ci` via GitHub Actions on every push to `master` and on a weekly schedule.

## Images

| Tag | Base |
|-----|------|
| `ubuntu-20.04` | Ubuntu 20.04 |
| `ubuntu-22.04` | Ubuntu 22.04 |
| `ubuntu-24.04` | Ubuntu 24.04 |

Each image comes pre-installed with the common build toolchain (`build-essential`, `cmake`, `check`, `python3-sphinx`, etc.) and a non-root `ci` user with passwordless sudo.
