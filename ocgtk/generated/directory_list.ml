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
  (** Returns [true] if the children enumeration is currently in progress.

      Files will be added to [self] from time to time while loading is going on.
      The order in which are added is undefined and may change in between runs.
  *)

  method set_attributes : string option -> unit
  (** Sets the [attributes] to be enumerated and starts the enumeration.

      If [attributes] is [None], the list of file infos will still be created,
      it will just not contain any extra attributes. *)

  method set_file : Ocgio.File.file_t option -> unit
  (** Sets the [file] to be enumerated and starts the enumeration.

      If [file] is [None], the result will be an empty list. *)

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

(* High-level class for DirectoryList *)
class directory_list (obj : Raw.Directory_list.t) : directory_list_t =
  object (self)
    inherit Ocgio.List_model.list_model (Ocgio.Raw.List_model.from_gobject obj)

    method get_attributes : unit -> string option =
      fun () -> Raw.Directory_list.get_attributes obj

    method get_error : unit -> GError.t option =
      fun () -> Raw.Directory_list.get_error obj

    method get_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.Directory_list.get_file obj)

    method get_io_priority : unit -> int =
      fun () -> Raw.Directory_list.get_io_priority obj

    method get_monitored : unit -> bool =
      fun () -> Raw.Directory_list.get_monitored obj

    method is_loading : unit -> bool =
      fun () -> Raw.Directory_list.is_loading obj

    method set_attributes : string option -> unit =
      fun attributes -> Raw.Directory_list.set_attributes obj attributes

    method set_file : Ocgio.File.file_t option -> unit =
      fun file ->
        let file = Option.map (fun c -> c#as_file) file in
        Raw.Directory_list.set_file obj file

    method set_io_priority : int -> unit =
      fun io_priority -> Raw.Directory_list.set_io_priority obj io_priority

    method set_monitored : bool -> unit =
      fun monitored -> Raw.Directory_list.set_monitored obj monitored

    method item_type = Raw.Directory_list.get_item_type obj
    method n_items = Raw.Directory_list.get_n_items obj
    method as_directory_list = obj
  end

let new_ (attributes : string option) (file : Ocgio.File.file_t option) :
    directory_list_t =
  let file = Option.map (fun c -> c#as_file) file in
  let obj_ = Raw.Directory_list.new_ attributes file in
  new directory_list obj_
