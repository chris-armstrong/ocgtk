# Known Bugs and Limitations

## macOS: Build failure due to missing `gio/gdesktopappinfo.h`

**Status**: Open  
**Affects**: macOS (Homebrew), all architectures  
**Tracked in**: opam-repository CI, PR #29729

### Symptom

The build fails on macOS with:

```
generated/gio_decls.h:13:10: fatal error: 'gio/gdesktopappinfo.h' file not found
```

This header is included unconditionally in `src/gio/generated/gio_decls.h` and
propagates to every C file that includes it (all of `ml_gio.c` and most generated
GIO C stubs).

### Root Cause

`gio/gdesktopappinfo.h` is a Unix-only GIO header for desktop application metadata
(`.desktop` files). It is not available on macOS (Homebrew's `glib` package omits it).
The GIR generator emits it unconditionally in `gio_decls.h` because
`GDesktopAppInfo` appears in the GIO namespace GIR file.

### Fix Required

The `gio_decls.h` generator (in `src/tools/gir_gen`) should wrap Unix-only headers
in `#ifdef G_OS_UNIX` guards, or add a `GDesktopAppInfo`-related entry to
`overrides/gio.sexp` to exclude the Unix-only types on non-Unix platforms.

Regenerating bindings after either fix will resolve the macOS build.
