(* GENERATED CODE - DO NOT EDIT *)
(* BookmarkList: BookmarkList *)

type t = [`bookmark_list | `object_] Gobject.obj

(** Create a new BookmarkList *)
external new_ : string option -> string option -> t = "ml_gtk_bookmark_list_new"

(* Properties *)

(** Sets the IO priority to use while loading files.

The default IO priority is %G_PRIORITY_DEFAULT. *)
external set_io_priority : t -> int -> unit = "ml_gtk_bookmark_list_set_io_priority"

(** Sets the @attributes to be enumerated and starts the enumeration.

If @attributes is %NULL, no attributes will be queried, but a list
of `GFileInfo`s will still be created. *)
external set_attributes : t -> string option -> unit = "ml_gtk_bookmark_list_set_attributes"

(** Returns %TRUE if the files are currently being loaded.

Files will be added to @self from time to time while loading is
going on. The order in which are added is undefined and may change
in between runs. *)
external is_loading : t -> bool = "ml_gtk_bookmark_list_is_loading"

(** Gets the IO priority to use while loading file. *)
external get_io_priority : t -> int = "ml_gtk_bookmark_list_get_io_priority"

(** Returns the filename of the bookmark file that
this list is loading. *)
external get_filename : t -> string = "ml_gtk_bookmark_list_get_filename"

(** Gets the attributes queried on the children. *)
external get_attributes : t -> string option = "ml_gtk_bookmark_list_get_attributes"

