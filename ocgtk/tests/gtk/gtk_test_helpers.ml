(** Helpers for gating GTK tests by runtime version *)

module GVersion = Ocgtk_gtk.GVersion
module GMain = Ocgtk_gtk.GMain

(** True if GTK initialised successfully on this system. *)
let gtk_available =
  try
    let _ = GMain.init () in
    true
  with GMain.Error _ -> false

(** [require_gtk f ()] runs [f ()] only when GTK is available, otherwise skips.
*)
let require_gtk f () = if gtk_available then f () else Alcotest.skip ()

(** [require_gtk_version major minor micro f ()] runs [f ()] only when the
    runtime GTK is at least [(major, minor, micro)]; otherwise skips the test.
*)
let require_gtk_version major minor micro f () =
  if GVersion.runtime_at_least major minor micro then f () else Alcotest.skip ()
