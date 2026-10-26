(** Helpers for gating GTK tests by runtime version *)

module Version = Ocgtk.Version
module Main = Ocgtk.Main

(** True if GTK initialised successfully on this system. *)
let gtk_available =
  try
    let _ = Main.init () in
    true
  with Main.Error _ -> false

(** [require_gtk f ()] runs [f ()] only when GTK is available, otherwise skips.
*)
let require_gtk f () = if gtk_available then f () else Alcotest.skip ()

(** [require_gtk_version major minor micro f ()] runs [f ()] only when the
    runtime GTK is at least [(major, minor, micro)]; otherwise skips the test.
*)
let require_gtk_version major minor micro f () =
  if Version.runtime_at_least major minor micro then f () else Alcotest.skip ()
