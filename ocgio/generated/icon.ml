class type icon_t = object
  (** {2:methods Methods} *)

  method equal : icon_t option -> bool
  (** Checks if two icons are equal. *)

  method hash : unit -> int
  (** Gets a hash for an icon. *)

  method serialize : unit -> Gvariant.t option
  (** Serializes a [GIcon] into a [GVariant]. An equivalent [GIcon] can be
      retrieved back by calling g_icon_deserialize() on the returned value. As
      serialization will avoid using raw icon data when possible, it only makes
      sense to transfer the [GVariant] between processes on the same machine,
      (as opposed to over the network), and within the same file system
      namespace. *)

  method to_string : unit -> string option
  (** Generates a textual representation of [icon] that can be used for
      serialization such as when passing [icon] to a different process or saving
      it to persistent storage. Use g_icon_new_for_string() to get [icon] back
      from the returned string.

      The encoding of the returned string is proprietary to [GIcon] except in
      the following two cases

      - If [icon] is a [GFileIcon], the returned string is a native path (such
        as [/path/to/my icon.png]) without escaping if the [GFile] for [icon] is
        a native file. If the file is not native, the returned string is the
        result of g_file_get_uri() (such as [sftp://path/to/my%20icon.png]).

      - If [icon] is a [GThemedIcon] with exactly one name and no fallbacks, the
        encoding is simply the name (such as [network-server]). *)

  (** {2:conversions Conversions} *)

  method as_icon : Raw.Icon.t
end

(* High-level class for Icon *)
class icon (obj : Raw.Icon.t) : icon_t =
  object (self)
    method equal : icon_t option -> bool =
      fun icon2 ->
        let icon2 = Option.map (fun c -> c#as_icon) icon2 in
        Raw.Icon.equal obj icon2

    method hash : unit -> int = fun () -> Raw.Icon.hash obj

    method serialize : unit -> Gvariant.t option =
      fun () -> Raw.Icon.serialize obj

    method to_string : unit -> string option = fun () -> Raw.Icon.to_string obj
    method as_icon = obj
  end
