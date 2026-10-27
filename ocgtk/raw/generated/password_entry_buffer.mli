(* GENERATED CODE - DO NOT EDIT *)
(* PasswordEntryBuffer: PasswordEntryBuffer *)

(** A [GtkEntryBuffer] that locks the underlying memory to prevent it from being
    swapped to disk.

    [GtkPasswordEntry] uses a [GtkPasswordEntryBuffer].

    The class built on this module is in {!Ocgtk.Password_entry_buffer}. *)

type t = [ `password_entry_buffer | `entry_buffer | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gtk_password_entry_buffer_get_type"

external new_ : unit -> t = "ml_gtk_password_entry_buffer_new"
(** Creates a new [GtkEntryBuffer] using secure memory allocations. *)

(* Methods *)
