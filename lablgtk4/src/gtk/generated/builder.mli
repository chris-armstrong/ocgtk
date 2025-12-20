(* GENERATED CODE - DO NOT EDIT *)
(* Builder: Builder *)

type t = [`builder | `object_] Gobject.obj

(** Create a new Builder *)
external new_ : unit -> t = "ml_gtk_builder_new"

(** Create a new Builder *)
external new_from_file : unit -> t = "ml_gtk_builder_new_from_file"

(** Create a new Builder *)
external new_from_resource : string -> t = "ml_gtk_builder_new_from_resource"

(** Create a new Builder *)
external new_from_string : string -> unit -> t = "ml_gtk_builder_new_from_string"

(* Methods *)
(** Sets the translation domain of @builder. *)
external set_translation_domain : t -> string option -> unit = "ml_gtk_builder_set_translation_domain"

(** Gets the translation domain of @builder. *)
external get_translation_domain : t -> string option = "ml_gtk_builder_get_translation_domain"

(** Parses a resource file containing a UI definition
and merges it with the current contents of @builder.

This function is useful if you need to call
[method@Gtk.Builder.set_current_object] to add user data to
callbacks before loading GtkBuilder UI. Otherwise, you probably
want [ctor@Gtk.Builder.new_from_resource] instead.

If an error occurs, 0 will be returned and @error will be assigned a
`GError` from the %GTK_BUILDER_ERROR, %G_MARKUP_ERROR or %G_RESOURCE_ERROR
domain.

It’s not really reasonable to attempt to handle failures of this
call.  The only reasonable thing to do when an error is detected is
to call g_error(). *)
external add_from_resource : t -> string -> (bool, GError.t) result = "ml_gtk_builder_add_from_resource"

(* Properties *)

