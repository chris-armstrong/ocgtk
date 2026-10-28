(** Contains the metadata associated with an item in the recently used files
    list.

    Its methods, signals and properties are on {!class-type-recent_info_t}. The
    functions it is built on are in {!Ocgtk.Raw.Recent_info}. *)

(** The methods, signals and properties of a [RecentInfo]. *)
class type recent_info_t = object
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

  method as_recent_info : Raw.Recent_info.t
end

class recent_info : Raw.Recent_info.t -> recent_info_t
(** Wraps a raw handle of {!Ocgtk.Raw.Recent_info.t}. *)
