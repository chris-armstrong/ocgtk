[@@@ocaml.text
"Manages and looks up recently used files.\n\n\
 Each recently used file is identified by its URI, and has meta-data\n\
 associated to it, like the names and command lines of the applications\n\
 that have registered it, the number of time each application has\n\
 registered the same file, the mime type of the file and whether\n\
 the file should be displayed only by the applications that have\n\
 registered it.\n\n\
 The recently used files list is per user.\n\n\
 [GtkRecentManager] acts like a database of all the recently\n\
 used files. You can create new [GtkRecentManager] objects, but\n\
 it is more efficient to use the default manager created by GTK.\n\n\
 Adding a new recently used file is as simple as:\n\n\
 {[\n\
 GtkRecentManager *manager;\n\n\
 manager = gtk_recent_manager_get_default ();\n\
 gtk_recent_manager_add_item (manager, file_uri);\n\
 ]}\n\n\
 The [GtkRecentManager] will try to gather all the needed information\n\
 from the file itself through GIO.\n\n\
 Looking up the meta-data associated with a recently used file\n\
 given its URI requires calling [Gtk.RecentManager.lookup_item]:\n\n\
 {[\n\
 GtkRecentManager *manager;\n\
 GtkRecentInfo *info;\n\
 GError *error = NULL;\n\n\
 manager = gtk_recent_manager_get_default ();\n\
 info = gtk_recent_manager_lookup_item (manager, file_uri, &error);\n\
 if (error)\n\
\  {\n\
\    g_warning (\"Could not find the file: %s\", error->message);\n\
\    g_error_free (error);\n\
\  }\n\
 else\n\
\ {\n\
\   // Use the info object\n\
\   gtk_recent_info_unref (info);\n\
\ }\n\
 ]}\n\n\
 In order to retrieve the list of recently used files, you can use\n\
 [Gtk.RecentManager.get_items], which returns a list of\n\
 [Gtk.RecentInfo].\n\n\
 Note that the maximum age of the recently used files list is\n\
 controllable through the [Gtk.Settings:gtk-recent-files-max-age]\n\
 property.\n\n\
 Its methods, signals and properties are on {!class-type-recent_manager_t}. \
 Its constructors are under {!section-constructors}. The functions it is built \
 on are in {!Ocgtk.Raw.Recent_manager}."]

(** The methods, signals and properties of a [GtkRecentManager]. *)
class type recent_manager_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the current recently used resources manager changes its
      contents.

      This can happen either by calling [Gtk.RecentManager.add_item] or by
      another application. *)

  method add_full : string -> Raw.Recent_data.t -> bool
  (** Adds a new resource, pointed by [uri], into the recently used resources
      list, using the metadata specified inside the [GtkRecentData] passed in
      [recent_data].

      The passed URI will be used to identify this resource inside the list.

      In order to register the new recently used resource, metadata about the
      resource must be passed as well as the URI; the metadata is stored in a
      [GtkRecentData], which must contain the MIME type of the resource pointed
      by the URI; the name of the application that is registering the item, and
      a command line to be used when launching the item.

      Optionally, a [GtkRecentData] might contain a UTF-8 string to be used when
      viewing the item instead of the last component of the URI; a short
      description of the item; whether the item should be considered private -
      that is, should be displayed only by the applications that have registered
      it. *)

  method add_item : string -> bool
  (** Adds a new resource, pointed by [uri], into the recently used resources
      list.

      This function automatically retrieves some of the needed metadata and
      setting other metadata to common default values; it then feeds the data to
      [Gtk.RecentManager.add_full].

      See [Gtk.RecentManager.add_full] if you want to explicitly define the
      metadata for the resource pointed by [uri]. *)

  method get_items : unit -> Raw.Recent_info.t list
  (** Gets the list of recently used resources. *)

  method has_item : string -> bool
  (** Checks whether there is a recently used resource registered with [uri]
      inside the recent manager. *)

  method lookup_item : string -> (Raw.Recent_info.t option, GError.t) result
  (** Searches for a URI inside the recently used resources list, and returns a
      [GtkRecentInfo] containing information about the resource like its MIME
      type, or its display name. *)

  method move_item : string -> string option -> (bool, GError.t) result
  (** Changes the location of a recently used resource from [uri] to [new_uri].

      Please note that this function will not affect the resource pointed by the
      URIs, but only the URI used in the recently used resources list. *)

  method purge_items : unit -> (int, GError.t) result
  (** Purges every item from the recently used resources list. *)

  method remove_item : string -> (bool, GError.t) result
  (** Removes a resource pointed by [uri] from the recently used resources list
      handled by a recent manager. *)

  method filename : string
  method size : int
  method as_recent_manager : Raw.Recent_manager.t
end

class recent_manager : Raw.Recent_manager.t -> recent_manager_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Recent_manager.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkRecentManager], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> recent_manager_t
(** Creates a new recent manager object.

    Recent manager objects are used to handle the list of recently used
    resources. A [GtkRecentManager] object monitors the recently used resources
    list, and emits the [Gtk.RecentManager::changed] signal each time something
    inside the list changes.

    [GtkRecentManager] objects are expensive: be sure to create them only when
    needed. You should use [Gtk.RecentManager.get_default] instead. *)
