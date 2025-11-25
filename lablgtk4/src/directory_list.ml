(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DirectoryList *)

type t = Gtk.widget

(** Create a new DirectoryList *)
external new_ : string option -> unit -> t = "ml_gtk_directory_list_new"

(* Properties *)

(** Sets whether the directory list will monitor the directory
for changes.

If monitoring is enabled, the ::items-changed signal will
be emitted when the directory contents change.


When monitoring is turned on after the initial creation
of the directory list, the directory is reloaded to avoid
missing files that appeared between the initial loading
and when monitoring was turned on. *)
external set_monitored : t -> bool -> unit = "ml_gtk_directory_list_set_monitored"

(** Sets the IO priority to use while loading directories.

Setting the priority while @self is loading will reprioritize the
ongoing load as soon as possible.

The default IO priority is %G_PRIORITY_DEFAULT, which is higher than
the GTK redraw priority. If you are loading a lot of directories in
parallel, lowering it to something like %G_PRIORITY_DEFAULT_IDLE
may increase responsiveness. *)
external set_io_priority : t -> int -> unit = "ml_gtk_directory_list_set_io_priority"

(** Sets the @attributes to be enumerated and starts the enumeration.

If @attributes is %NULL, the list of file infos will still be created, it will just
not contain any extra attributes. *)
external set_attributes : t -> string option -> unit = "ml_gtk_directory_list_set_attributes"

(** Returns %TRUE if the children enumeration is currently in
progress.

Files will be added to @self from time to time while loading is
going on. The order in which are added is undefined and may change
in between runs. *)
external is_loading : t -> bool = "ml_gtk_directory_list_is_loading"

(** Returns whether the directory list is monitoring
the directory for changes. *)
external get_monitored : t -> bool = "ml_gtk_directory_list_get_monitored"

(** Gets the IO priority set via gtk_directory_list_set_io_priority(). *)
external get_io_priority : t -> int = "ml_gtk_directory_list_get_io_priority"

(** Gets the attributes queried on the children. *)
external get_attributes : t -> string = "ml_gtk_directory_list_get_attributes"

