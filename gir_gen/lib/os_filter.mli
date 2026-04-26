(** OS/platform filter for conditional compilation guards.

    Used in override files to restrict entity or component generation to
    specific OS platforms. The generator emits C preprocessor guards from these
    values.

    Supported platform names: ["linux"], ["macos"], ["freebsd"], ["unix"],
    ["windows"]. Unknown names fall back to a generic [defined(OS_<NAME>)]
    expression. *)

type t =
  | Os_only of string list
      (** Emit only on the listed platforms. Multiple names are OR-combined:
          [(os "linux") (os "macos")] →
          [#if defined(__linux__) || (defined(__APPLE__) && defined(__MACH__))]
      *)
  | Os_except of string list
      (** Emit on all platforms except the listed ones. Multiple names are
          AND-combined: [(not_os "windows") (not_os "macos")] →
          [#if !defined(_WIN32) && !(defined(__APPLE__) && defined(__MACH__))]
      *)
[@@deriving sexp, eq]
