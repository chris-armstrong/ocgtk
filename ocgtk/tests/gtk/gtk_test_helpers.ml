(** Helpers for gating GTK tests by runtime version *)

module GVersion = Ocgtk_gtk.GVersion

(** [require_gtk_version major minor micro f ()] runs [f ()] only when the
    runtime GTK is at least [(major, minor, micro)]; otherwise skips the test. *)
let require_gtk_version major minor micro f () =
  if GVersion.runtime_at_least major minor micro then f ()
  else Alcotest.skip ()
