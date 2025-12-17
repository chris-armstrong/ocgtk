(* GENERATED CODE - DO NOT EDIT *)
(* Builder: Builder *)

type t = [`builder | `object_] Gobject.obj

(** Create a new Builder *)
external new_ : unit -> t = "ml_gtk_builder_new"

(** Create a new Builder *)
external new_from_file : string -> t = "ml_gtk_builder_new_from_file"

(** Create a new Builder *)
external new_from_resource : string -> t = "ml_gtk_builder_new_from_resource"

(** Create a new Builder *)
external new_from_string : string -> unit -> t = "ml_gtk_builder_new_from_string"

(* Properties *)

(** Sets the translation domain of @builder. *)
external set_translation_domain : t -> string option -> unit = "ml_gtk_builder_set_translation_domain"

(** Sets the scope the builder should operate in.

If @scope is %NULL, a new [class@Gtk.BuilderCScope] will be created. *)
external set_scope : t -> Builder_scope.t option -> unit = "ml_gtk_builder_set_scope"

(** Gets the translation domain of @builder. *)
external get_translation_domain : t -> string option = "ml_gtk_builder_get_translation_domain"

(** Gets the scope in use that was set via gtk_builder_set_scope(). *)
external get_scope : t -> Builder_scope.t = "ml_gtk_builder_get_scope"

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

(** Parses a file containing a UI definition and merges it with
the current contents of @builder.

This function is useful if you need to call
[method@Gtk.Builder.set_current_object]) to add user data to
callbacks before loading GtkBuilder UI. Otherwise, you probably
want [ctor@Gtk.Builder.new_from_file] instead.

If an error occurs, 0 will be returned and @error will be assigned a
`GError` from the `GTK_BUILDER_ERROR`, `G_MARKUP_ERROR` or `G_FILE_ERROR`
domains.

It’s not really reasonable to attempt to handle failures of this
call. You should not use this function with untrusted files (ie:
files that are not part of your application). Broken `GtkBuilder`
files can easily crash your program, and it’s possible that memory
was leaked leading up to the reported failure. The only reasonable
thing to do when an error is detected is to call `g_error()`. *)
external add_from_file : t -> string -> (bool, GError.t) result = "ml_gtk_builder_add_from_file"

