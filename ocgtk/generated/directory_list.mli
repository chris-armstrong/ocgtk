(** A list model that wraps [Gio.File.enumerate_children_async].

    Its methods, signals and properties are on {!class-type-directory_list_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Directory_list}. *)

(** {1:class Class} *)

class type directory_list_t = object
  inherit Ocgio.List_model.list_model_t

  (** {2:methods Methods} *)

  method get_attributes : unit -> string option
  (** Gets the attributes queried on the children. *)

  method get_error : unit -> GError.t option
  (** Gets the loading error, if any.

      If an error occurs during the loading process, the loading process will
      finish and this property allows querying the error that happened. This
      error will persist until a file is loaded again.

      An error being set does not mean that no files were loaded, and all
      successfully queried files will remain in the list. *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the file whose children are currently enumerated. *)

  method get_io_priority : unit -> int
  (** Gets the IO priority set via gtk_directory_list_set_io_priority(). *)

  method get_monitored : unit -> bool
  (** Returns whether the directory list is monitoring the directory for
      changes. *)

  method is_loading : unit -> bool
  (** Returns [TRUE] if the children enumeration is currently in progress.

      Files will be added to [self] from time to time while loading is going on.
      The order in which are added is undefined and may change in between runs.
  *)

  method set_attributes : string option -> unit
  (** Sets the [attributes] to be enumerated and starts the enumeration.

      If [attributes] is [NULL], the list of file infos will still be created,
      it will just not contain any extra attributes. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Sets the [file] to be enumerated and starts the enumeration.

      If [file] is [NULL], the result will be an empty list. *)

  method set_io_priority : int -> unit
  (** Sets the IO priority to use while loading directories.

      Setting the priority while [self] is loading will reprioritize the ongoing
      load as soon as possible.

      The default IO priority is [G_PRIORITY_DEFAULT], which is higher than the
      GTK redraw priority. If you are loading a lot of directories in parallel,
      lowering it to something like [G_PRIORITY_DEFAULT_IDLE] may increase
      responsiveness. *)

  method set_monitored : bool -> unit
  (** Sets whether the directory list will monitor the directory for changes.

      If monitoring is enabled, the ::items-changed signal will be emitted when
      the directory contents change.

      When monitoring is turned on after the initial creation of the directory
      list, the directory is reloaded to avoid missing files that appeared
      between the initial loading and when monitoring was turned on. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_directory_list : Raw.Directory_list.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [DirectoryList].}\n\n\
     Implements:\n\
     - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}\n\n\
     A list model that wraps [Gio.File.enumerate_children_async].\n\n\
     It presents a [GListModel] and fills it asynchronously with the \
     [GFileInfo]s\n\
     returned from that function.\n\n\
     Enumeration will start automatically when the\n\
     [Gtk.DirectoryList:file] property is set.\n\n\
     While the [GtkDirectoryList] is being filled, the\n\
     [Gtk.DirectoryList:loading] property will be set to [TRUE]. You can\n\
     listen to that property if you want to show information like a [GtkSpinner]\n\
     or a \"Loading...\" text.\n\n\
     If loading fails at any point, the [Gtk.DirectoryList:error]\n\
     property will be set to give more indication about the failure.\n\n\
     The [GFileInfo]s returned from a [GtkDirectoryList] have the \
     \"standard::file\"\n\
     attribute set to the [GFile] they refer to. This way you can get at the \
     file\n\
     that is referred to in the same way you would via \
     g_file_enumerator_get_child().\n\
     This means you do not need access to the [GtkDirectoryList], but can access\n\
     the [GFile] directly from the [GFileInfo] when operating with a \
     [GtkListView]\n\
     or similar."]

class directory_list : Raw.Directory_list.t -> directory_list_t
(** Wraps a raw handle of {!Ocgtk.Raw.Directory_list.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 A list model that wraps [Gio.File.enumerate_children_async].\n\n\
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
 or similar."]

(** {1:constructors Constructors} *)

val new_ : string option -> Ocgio.File.file_t option -> directory_list_t
(** Creates a new [GtkDirectoryList].

    The [GtkDirectoryList] is querying the given [file] with the given
    [attributes]. *)
