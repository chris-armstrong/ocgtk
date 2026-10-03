(* GENERATED CODE - DO NOT EDIT *)
(* RecentManager: RecentManager *)

type t = [ `recent_manager | `object_ ] Gobject.obj
(** Manages and looks up recently used files.

    Each recently used file is identified by its URI, and has meta-data
    associated to it, like the names and command lines of the applications that
    have registered it, the number of time each application has registered the
    same file, the mime type of the file and whether the file should be
    displayed only by the applications that have registered it.

    The recently used files list is per user.

    [GtkRecentManager] acts like a database of all the recently used files. You
    can create new [GtkRecentManager] objects, but it is more efficient to use
    the default manager created by GTK.

    Adding a new recently used file is as simple as:

    {[
    GtkRecentManager * manager;

    manager = gtk_recent_manager_get_default ();
    gtk_recent_manager_add_item (manager, file_uri)
    ]}

    The [GtkRecentManager] will try to gather all the needed information from
    the file itself through GIO.

    Looking up the meta-data associated with a recently used file given its URI
    requires calling [Gtk.RecentManager.lookup_item]:

    {[
    GtkRecentManager *manager;
    GtkRecentInfo *info;
    GError *error = NULL;

    manager = gtk_recent_manager_get_default ();
    info = gtk_recent_manager_lookup_item (manager, file_uri, &error);
    if (error)
      {
        g_warning (“Could not find the file: %s”, error->message);
        g_error_free (error);
      }
    else
     {
       // Use the info object
       gtk_recent_info_unref (info);
     }
    ]}

    In order to retrieve the list of recently used files, you can use
    [Gtk.RecentManager.get_items], which returns a list of [Gtk.RecentInfo].

    Note that the maximum age of the recently used files list is controllable
    through the [Gtk.Settings:gtk-recent-files-max-age] property. *)

external new_ : unit -> t = "ml_gtk_recent_manager_new"
(** Create a new RecentManager *)

(* Methods *)

external remove_item : t -> string -> (bool, GError.t) result
  = "ml_gtk_recent_manager_remove_item"
(** Removes a resource pointed by [uri] from the recently used resources list
    handled by a recent manager. *)

external purge_items : t -> (int, GError.t) result
  = "ml_gtk_recent_manager_purge_items"
(** Purges every item from the recently used resources list. *)

external move_item : t -> string -> string option -> (bool, GError.t) result
  = "ml_gtk_recent_manager_move_item"
(** Changes the location of a recently used resource from [uri] to [new_uri].

    Please note that this function will not affect the resource pointed by the
    URIs, but only the URI used in the recently used resources list. *)

external lookup_item : t -> string -> (Recent_info.t option, GError.t) result
  = "ml_gtk_recent_manager_lookup_item"
(** Searches for a URI inside the recently used resources list, and returns a
    [GtkRecentInfo] containing information about the resource like its MIME
    type, or its display name. *)

external has_item : t -> string -> bool = "ml_gtk_recent_manager_has_item"
(** Checks whether there is a recently used resource registered with [uri]
    inside the recent manager. *)

external get_items : t -> Recent_info.t list = "ml_gtk_recent_manager_get_items"
(** Gets the list of recently used resources. *)

external add_item : t -> string -> bool = "ml_gtk_recent_manager_add_item"
(** Adds a new resource, pointed by [uri], into the recently used resources
    list.

    This function automatically retrieves some of the needed metadata and
    setting other metadata to common default values; it then feeds the data to
    [Gtk.RecentManager.add_full].

    See [Gtk.RecentManager.add_full] if you want to explicitly define the
    metadata for the resource pointed by [uri]. *)

external add_full : t -> string -> Recent_data.t -> bool
  = "ml_gtk_recent_manager_add_full"
(** Adds a new resource, pointed by [uri], into the recently used resources
    list, using the metadata specified inside the [GtkRecentData] passed in
    [recent_data].

    The passed URI will be used to identify this resource inside the list.

    In order to register the new recently used resource, metadata about the
    resource must be passed as well as the URI; the metadata is stored in a
    [GtkRecentData], which must contain the MIME type of the resource pointed by
    the URI; the name of the application that is registering the item, and a
    command line to be used when launching the item.

    Optionally, a [GtkRecentData] might contain a UTF-8 string to be used when
    viewing the item instead of the last component of the URI; a short
    description of the item; whether the item should be considered private -
    that is, should be displayed only by the applications that have registered
    it. *)

(* Properties *)

external get_filename : t -> string = "ml_gtk_recent_manager_get_filename"
(** Get property: filename *)

external get_size : t -> int = "ml_gtk_recent_manager_get_size"
(** Get property: size *)

val on_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
