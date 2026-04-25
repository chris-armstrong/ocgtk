# Distro Compatibility Testing

The `ci/` directory provides a Docker-based environment for testing the build and
test suite against multiple Linux distributions. This catches platform-specific
failures (missing headers, version-guarded API differences, package naming) before
they reach users.

## Supported Distros

| Service name   | Image                          | Key GTK version      | Notes |
|----------------|--------------------------------|----------------------|-------|
| `ubuntu22`     | `ubuntu:22.04`                 | GTK 4.6 / GLib 2.72 | Oldest GTK in the matrix |
| `debian12`     | `debian:12`                    | GTK 4.8 / GLib 2.74 | |
| `centos9`      | `quay.io/centos/centos:stream9`| GTK 4.x / GLib 2.68 | Pango < 1.50 — tests cross-namespace version guards |
| `opensuse15`   | `opensuse/leap:15.6`           | GTK 4.x / Pango 1.50| GTK < 4.14 — StringList tests skip |
| `fedora40`     | `fedora:40`                    | GTK 4.14+ / Pango 1.52 | Newer RHEL-family; all tests run |
| `fedora43`     | `fedora:43`                    | GTK 4.16+            | Latest Fedora |
| `ubuntu25`     | `ubuntu:25.04`                 | GTK 4.16+            | Latest Ubuntu LTS |
| `ubuntu24`     | `ubuntu:24.04`                 | GTK 4.14+            | **Opt-in only** — excluded from default `oci up/build/down` runs since the dev environment is Ubuntu 24.04 |

Ubuntu 22.04 is the most important test target because GLib 2.72 is the boundary
where several version-guarded APIs (e.g. `G_CONNECT_DEFAULT`, `G_APPLICATION_DEFAULT_FLAGS`)
were introduced.

## Design

```
ci/
  oci                    # management CLI
  docker-compose.yml     # service definitions
  versions.env           # OPAM_VERSION and OCAML_VERSION pins (edit here to update all)
  ubuntu22.Dockerfile
  ubuntu24.Dockerfile    # opt-in
  debian12.Dockerfile
  centos9.Dockerfile
  opensuse15.Dockerfile
  fedora40.Dockerfile
  scripts/
    build.sh             # dune build --build-dir /build
    test.sh              # dune test gir_gen/ then xvfb-run dune test ocgtk/ (both with --build-dir /build)
```

Each Dockerfile:
- Installs system packages (GTK 4 dev headers, GIR files, Xvfb)
- Downloads and installs opam at `OPAM_VERSION`
- Creates an OCaml switch at `OCAML_VERSION`
- Pre-installs all opam dependencies from `ocgtk.opam` and `gir_gen.opam`

The source tree is **bind-mounted** at `/workspace` at runtime — no source copy in
the image. Each service has a **named Docker volume** for its dune `_build` dir
(`/build` inside the container), so:
- Incremental builds work across `oci run` invocations
- Different distros have independent build caches
- The host `_build` directory is not polluted

## Version Pins

Edit `ci/versions.env` to update opam or OCaml versions across all distros at once:

```
OPAM_VERSION=2.5.0
OCAML_VERSION=5.3.0
```

Then rebuild images: `./ci/oci build`.

## Usage

```bash
# First time — build images (compiles OCaml from source, takes ~20 min per distro)
./ci/oci build ubuntu22

# Start a distro container in the background
./ci/oci up ubuntu22

# Run the build
./ci/oci run ubuntu22 build

# Run the test suite
./ci/oci run ubuntu22 test

# Drop into a shell to investigate failures
./ci/oci shell ubuntu22

# Build and test all distros
./ci/oci up
./ci/oci run ubuntu22 build && ./ci/oci run debian12 build && \
./ci/oci run centos9 build && ./ci/oci run opensuse15 build

# Show running containers, volumes, and disk usage
./ci/oci status

# Stop containers (images and volumes preserved; next run is incremental)
./ci/oci down

# Free disk for one distro (removes container + build volume)
./ci/oci clean debian12

# Full teardown — removes containers, volumes, images, and build cache
./ci/oci clean --all
```

## Lifecycle Management

`oci status` shows:
- Which containers are currently running
- When each image was last built (from `ci/.oci-state`)
- Named volume list
- `docker system df` disk usage summary

`oci clean [distro...]` removes the container and its named build volume.
`oci clean --all` additionally removes images and prunes the build cache — use this
when you are done testing and want to recover disk space.

## Adding a New Distro

1. Create `ci/<name>.Dockerfile` following an existing one as a template.
2. Add the service to `ci/docker-compose.yml` (copy an existing service block, add
   a matching named volume).
3. Add the service name to `ALL_DISTROS` in `ci/oci`.
