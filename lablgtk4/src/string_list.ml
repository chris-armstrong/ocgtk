(* GENERATED CODE - DO NOT EDIT *)
(* Widget: StringList *)

type t = Gtk.widget

(** Create a new StringList *)
external new_ : unit -> t = "ml_gtk_string_list_new"

(* Properties *)

(** Removes the string at @position from @self.

@position must be smaller than the current
length of the list. *)
external remove : t -> int -> unit = "ml_gtk_string_list_remove"

(** Gets the string that is at @position in @self.

If @self does not contain @position items, %NULL is returned.

This function returns the const char *. To get the
object wrapping it, use g_list_model_get_item(). *)
external get_string : t -> int -> string = "ml_gtk_string_list_get_string"

(** Appends @string to @self.

The @string will be copied. See
[method@Gtk.StringList.take] for a way to avoid that. *)
external append : t -> string -> unit = "ml_gtk_string_list_append"

