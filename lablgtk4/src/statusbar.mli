(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Statusbar *)

type t = [`statusbar | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new Statusbar *)
external new_ : unit -> t = "ml_gtk_statusbar_new"

(** Forces the removal of all messages from a statusbar's
stack with the exact @context_id. *)
external remove_all : t -> int -> unit = "ml_gtk_statusbar_remove_all"

(** Forces the removal of a message from a statusbar’s stack.
The exact @context_id and @message_id must be specified. *)
external remove : t -> int -> int -> unit = "ml_gtk_statusbar_remove"

(** Pushes a new message onto a statusbar’s stack. *)
external push : t -> int -> string -> int = "ml_gtk_statusbar_push"

(** Removes the first message in the `GtkStatusbar`’s stack
with the given context id.

Note that this may not change the displayed message,
if the message at the top of the stack has a different
context id. *)
external pop : t -> int -> unit = "ml_gtk_statusbar_pop"

(** Returns a new context identifier, given a description
of the actual context.

Note that the description is not shown in the UI. *)
external get_context_id : t -> string -> int = "ml_gtk_statusbar_get_context_id"

