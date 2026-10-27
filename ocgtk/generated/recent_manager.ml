class type recent_manager_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

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

(* High-level class for RecentManager *)
class recent_manager (obj : Raw.Recent_manager.t) : recent_manager_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Recent_manager.on_changed ~after self#as_recent_manager ~callback

    method add_full : string -> Raw.Recent_data.t -> bool =
      fun uri recent_data -> Raw.Recent_manager.add_full obj uri recent_data

    method add_item : string -> bool =
      fun uri -> Raw.Recent_manager.add_item obj uri

    method get_items : unit -> Raw.Recent_info.t list =
      fun () -> Raw.Recent_manager.get_items obj

    method has_item : string -> bool =
      fun uri -> Raw.Recent_manager.has_item obj uri

    method lookup_item : string -> (Raw.Recent_info.t option, GError.t) result =
      fun uri -> Raw.Recent_manager.lookup_item obj uri

    method move_item : string -> string option -> (bool, GError.t) result =
      fun uri new_uri -> Raw.Recent_manager.move_item obj uri new_uri

    method purge_items : unit -> (int, GError.t) result =
      fun () -> Raw.Recent_manager.purge_items obj

    method remove_item : string -> (bool, GError.t) result =
      fun uri -> Raw.Recent_manager.remove_item obj uri

    method filename = Raw.Recent_manager.get_filename obj
    method size = Raw.Recent_manager.get_size obj
    method as_recent_manager = obj
  end

let new_ () : recent_manager_t = new recent_manager (Raw.Recent_manager.new_ ())
