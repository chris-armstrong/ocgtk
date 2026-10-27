[@@@ocaml.text
"A list model that wraps [Gio.File.enumerate_children_async].\n\n\
 It presents a [GListModel] and fills it asynchronously with the [GFileInfo]s\n\
 returned from that function.\n\n\
 Enumeration will start automatically when the\n\
 [Gtk.DirectoryList:file] property is set.\n\n\
 While the [GtkDirectoryList] is being filled, the\n\
 [Gtk.DirectoryList:loading] property will be set to [TRUE]. You can\n\
 listen to that property if you want to show information like a [GtkSpinner]\n\
 or a \"Loading...\" text.\n\n\
 If loading fails at any point, the [Gtk.DirectoryList:error]\n\
 property will be set to give more indication about the failure.\n\n\
 The [GFileInfo]s returned from a [GtkDirectoryList] have the \"standard::file\"\n\
 attribute set to the [GFile] they refer to. This way you can get at the file\n\
 that is referred to in the same way you would via \
 g_file_enumerator_get_child().\n\
 This means you do not need access to the [GtkDirectoryList], but can access\n\
 the [GFile] directly from the [GFileInfo] when operating with a [GtkListView]\n\
 or similar.\n\n\
 Its methods, signals and properties are on {!class-type-directory_list_t}. \
 The functions it is built on are in {!Ocgtk.Raw.Directory_list}."]

(** The methods, signals and properties of a [GtkDirectoryList]. *)
class type directory_list_t = object
  inherit Ocgio.List_model.list_model_t
  method get_attributes : unit -> string option
  method get_error : unit -> GError.t option
  method get_file : unit -> Ocgio.File.file_t option
  method get_io_priority : unit -> int
  method get_monitored : unit -> bool
  method is_loading : unit -> bool
  method set_attributes : string option -> unit
  method set_file : Ocgio.File.file_t option -> unit
  method set_io_priority : int -> unit
  method set_monitored : bool -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_directory_list : Raw.Directory_list.t
end

class directory_list : Raw.Directory_list.t -> directory_list_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Directory_list.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkDirectoryList], give one already wrapped. *)

val new_ : string option -> Ocgio.File.file_t option -> directory_list_t
