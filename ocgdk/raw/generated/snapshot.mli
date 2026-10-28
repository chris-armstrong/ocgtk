(* GENERATED CODE - DO NOT EDIT *)
(* Snapshot: Snapshot *)

(** Base type for snapshot operations.

    The subclass of [GdkSnapshot] used by GTK is GtkSnapshot.

    The class built on this module is in {!Ocgdk.Snapshot}. *)

type t = [ `snapshot | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_snapshot_get_type"

(* Methods *)
