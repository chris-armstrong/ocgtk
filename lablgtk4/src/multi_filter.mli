(* GENERATED CODE - DO NOT EDIT *)
(* Widget: MultiFilter *)

type t = Gtk.widget

(* Properties *)

(** Removes the filter at the given @position from the list of filters used
by @self.

If @position is larger than the number of filters, nothing happens and
the function returns. *)
external remove : t -> int -> unit = "ml_gtk_multi_filter_remove"

(** Adds a @filter to @self to use for matching. *)
external append : t -> Gtk.widget -> unit = "ml_gtk_multi_filter_append"

