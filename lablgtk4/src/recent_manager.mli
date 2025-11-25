(* GENERATED CODE - DO NOT EDIT *)
(* Widget: RecentManager *)

type t = Gtk.widget

(** Create a new RecentManager *)
external new_ : unit -> t = "ml_gtk_recent_manager_new"

(* Properties *)

(** Removes a resource pointed by @uri from the recently used resources
list handled by a recent manager. *)
external remove_item : t -> string -> (bool, GError.t) result = "ml_gtk_recent_manager_remove_item"

(** Purges every item from the recently used resources list. *)
external purge_items : t -> (int, GError.t) result = "ml_gtk_recent_manager_purge_items"

(** Changes the location of a recently used resource from @uri to @new_uri.

Please note that this function will not affect the resource pointed
by the URIs, but only the URI used in the recently used resources list. *)
external move_item : t -> string -> string option -> (bool, GError.t) result = "ml_gtk_recent_manager_move_item"

(** Searches for a URI inside the recently used resources list, and
returns a `GtkRecentInfo` containing information about the resource
like its MIME type, or its display name. *)
external lookup_item : t -> string -> (Gtk.widget option, GError.t) result = "ml_gtk_recent_manager_lookup_item"

(** Checks whether there is a recently used resource registered
with @uri inside the recent manager. *)
external has_item : t -> string -> bool = "ml_gtk_recent_manager_has_item"

(** Adds a new resource, pointed by @uri, into the recently used
resources list.

This function automatically retrieves some of the needed
metadata and setting other metadata to common default values;
it then feeds the data to [method@Gtk.RecentManager.add_full].

See [method@Gtk.RecentManager.add_full] if you want to explicitly
define the metadata for the resource pointed by @uri. *)
external add_item : t -> string -> bool = "ml_gtk_recent_manager_add_item"

