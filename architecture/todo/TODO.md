# Todos

Outstanding work items for ocgtk. For known bugs and intentional limitations
see [KNOWN_BUGS.md](./KNOWN_BUGS.md).

## Class hierarchy

- Layer 1 parent-chain accessors (`as_widget : t -> Widget.t` etc.) are not yet
  generated from the parent chain. `Obj.magic` is used at Layer 2 instead.
- Methods that accept interface types as parameters are currently skipped (BUG-004).
  Proper interface parameter handling requires `as_<interface>` accessors.

## Signal handling

- Signals with complex parameter types (boxed records, `GdkEvent`, callbacks)
  are not yet generated. See `gir_gen/docs/plans/milestone-2-signals.md` for the
  active plan.
- Signal return values are supported for primitives only; non-primitive returns
  are deferred.

## Interface generation

Interfaces are generated as ordinary classes but should be generated as virtual
classes (or class types) with virtual methods that concrete classes inherit and
implement.

## Array length hiding (BUG-002)

The companion length parameter for length-based arrays is hidden from the C stub
but still visible in the Layer 1 OCaml signature. It should be dropped from the
OCaml API entirely with the length derived from `Array.length`.

## Static functions (BUG-005)

`<function>` elements in GIR (static methods with no implicit `self`) are not yet
generated.

## macOS build (BUG-010)

`gio/gdesktopappinfo.h` is included unconditionally in `gio_decls.h` but is not
available on macOS (Homebrew omits it). The fix is to wrap it in `#ifdef G_OS_UNIX`
or ignore `GDesktopAppInfo` via the override file.
