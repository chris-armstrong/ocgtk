(* GENERATED CODE - DO NOT EDIT *)
(* StringList: StringList *)

type t = [`string_list | `object_] Gobject.obj

(** Create a new StringList *)
external new_ : unit -> t = "ml_gtk_string_list_new"

(* Methods *)
(** Adds @string to self at the end, and takes
ownership of it.

This variant of [method@Gtk.StringList.append]
is convenient for formatting strings:

```c
gtk_string_list_take (self, g_strdup_print ("%d dollars", lots));
``` *)
external take : t -> string -> unit = "ml_gtk_string_list_take"

(** Removes the string at @position from @self.

@position must be smaller than the current
length of the list. *)
external remove : t -> int -> unit = "ml_gtk_string_list_remove"

(** Gets the string that is at @position in @self.

If @self does not contain @position items, %NULL is returned.

This function returns the const char *. To get the
object wrapping it, use g_list_model_get_item(). *)
external get_string : t -> int -> string option = "ml_gtk_string_list_get_string"

(** Appends @string to @self.

The @string will be copied. See
[method@Gtk.StringList.take] for a way to avoid that. *)
external append : t -> string -> unit = "ml_gtk_string_list_append"

(* Properties *)

(** Get property: n-items *)
external get_n_items : t -> int = "ml_gtk_string_list_get_n_items"

