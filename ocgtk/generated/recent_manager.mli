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
 The functions it is built on are in {!Ocgtk.Raw.Recent_manager}."]

(** The methods, signals and properties of a [GtkRecentManager]. *)
class type recent_manager_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method add_full : string -> Raw.Recent_data.t -> bool
  method add_item : string -> bool
  method get_items : unit -> Raw.Recent_info.t list
  method has_item : string -> bool
  method lookup_item : string -> (Raw.Recent_info.t option, GError.t) result
  method move_item : string -> string option -> (bool, GError.t) result
  method purge_items : unit -> (int, GError.t) result
  method remove_item : string -> (bool, GError.t) result
  method filename : string
  method size : int
  method as_recent_manager : Raw.Recent_manager.t
end

class recent_manager : Raw.Recent_manager.t -> recent_manager_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Recent_manager.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkRecentManager], give one already wrapped. *)

val new_ : unit -> recent_manager_t
