(* GENERATED CODE - DO NOT EDIT *)
(* PasswordEntryBuffer: PasswordEntryBuffer *)

(** A [GtkEntryBuffer] that locks the underlying memory to prevent it from being
    swapped to disk.

    [GtkPasswordEntry] uses a [GtkPasswordEntryBuffer]. *)

type t = [ `password_entry_buffer | `entry_buffer | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_password_entry_buffer_new"
(** Create a new PasswordEntryBuffer *)

(* Methods *)
