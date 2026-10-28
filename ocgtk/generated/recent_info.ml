class type recent_info_t = object
  (** {2:methods Methods} *)

  method create_app_info :
    string option -> (Ocgio.App_info.app_info_t option, GError.t) result
  (** Creates a [GAppInfo] for the specified [GtkRecentInfo]

      In case of error, [error] will be set either with a
      [GTK_RECENT_MANAGER_ERROR] or a [G_IO_ERROR] *)

  method exists : unit -> bool
  (** Checks whether the resource pointed by [info] still exists. At the moment
      this check is done only on resources pointing to local files. *)

  method get_age : unit -> int
  (** Gets the number of days elapsed since the last update of the resource
      pointed by [info]. *)

  method get_description : unit -> string
  (** Gets the (short) description of the resource. *)

  method get_display_name : unit -> string
  (** Gets the name of the resource.

      If none has been defined, the basename of the resource is obtained. *)

  method get_gicon : unit -> Ocgio.Icon.icon_t option
  (** Retrieves the icon associated to the resource MIME type. *)

  method get_mime_type : unit -> string
  (** Gets the MIME type of the resource. *)

  method get_private_hint : unit -> bool
  (** Gets the value of the “private” flag.

      Resources in the recently used list that have this flag set to [TRUE]
      should only be displayed by the applications that have registered them. *)

  method get_short_name : unit -> string
  (** Computes a valid UTF-8 string that can be used as the name of the item in
      a menu or list.

      For example, calling this function on an item that refers to
      “file:///foo/bar.txt” will yield “bar.txt”. *)

  method get_uri : unit -> string
  (** Gets the URI of the resource. *)

  method get_uri_display : unit -> string option
  (** Gets a displayable version of the resource’s URI.

      If the resource is local, it returns a local path; if the resource is not
      local, it returns the UTF-8 encoded content of [Gtk.RecentInfo.get_uri].
  *)

  method has_application : string -> bool
  (** Checks whether an application registered this resource using [app_name].
  *)

  method has_group : string -> bool
  (** Checks whether [group_name] appears inside the groups registered for the
      recently used item [info]. *)

  method is_local : unit -> bool
  (** Checks whether the resource is local or not by looking at the scheme of
      its URI. *)

  method last_application : unit -> string
  (** Gets the name of the last application that have registered the recently
      used resource represented by [info]. *)

  method match_ : Raw.Recent_info.t -> bool
  (** Checks whether two [GtkRecentInfo] point to the same resource. *)

  method ref : unit -> Raw.Recent_info.t
  (** Increases the reference count of [recent_info] by one. *)

  (** {2:conversions Conversions} *)

  method as_recent_info : Raw.Recent_info.t
end

(* High-level class for RecentInfo *)
class recent_info (obj : Raw.Recent_info.t) : recent_info_t =
  object (self)
    method create_app_info :
        string option -> (Ocgio.App_info.app_info_t option, GError.t) result =
      fun app_name ->
        Result.map
          (fun ret ->
            Option.map (fun ret -> new Ocgio.App_info.app_info ret) ret)
          (Raw.Recent_info.create_app_info obj app_name)

    method exists : unit -> bool = fun () -> Raw.Recent_info.exists obj
    method get_age : unit -> int = fun () -> Raw.Recent_info.get_age obj

    method get_description : unit -> string =
      fun () -> Raw.Recent_info.get_description obj

    method get_display_name : unit -> string =
      fun () -> Raw.Recent_info.get_display_name obj

    method get_gicon : unit -> Ocgio.Icon.icon_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Icon.icon ret)
          (Raw.Recent_info.get_gicon obj)

    method get_mime_type : unit -> string =
      fun () -> Raw.Recent_info.get_mime_type obj

    method get_private_hint : unit -> bool =
      fun () -> Raw.Recent_info.get_private_hint obj

    method get_short_name : unit -> string =
      fun () -> Raw.Recent_info.get_short_name obj

    method get_uri : unit -> string = fun () -> Raw.Recent_info.get_uri obj

    method get_uri_display : unit -> string option =
      fun () -> Raw.Recent_info.get_uri_display obj

    method has_application : string -> bool =
      fun app_name -> Raw.Recent_info.has_application obj app_name

    method has_group : string -> bool =
      fun group_name -> Raw.Recent_info.has_group obj group_name

    method is_local : unit -> bool = fun () -> Raw.Recent_info.is_local obj

    method last_application : unit -> string =
      fun () -> Raw.Recent_info.last_application obj

    method match_ : Raw.Recent_info.t -> bool =
      fun info_b -> Raw.Recent_info.match_ obj info_b

    method ref : unit -> Raw.Recent_info.t = fun () -> Raw.Recent_info.ref obj
    method as_recent_info = obj
  end
