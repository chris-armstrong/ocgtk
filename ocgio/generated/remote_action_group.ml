class type remote_action_group_t = object
  (** {2:methods Methods} *)

  method activate_action_full :
    string -> Gvariant.t option -> Gvariant.t -> unit
  [@@ocaml.doc
    "Activates the remote action.\n\n\
     This is the same as g_action_group_activate_action() except that it\n\
     allows for provision of \"platform data\" to be sent along with the\n\
     activation request.  This typically contains details such as the user\n\
     interaction timestamp or startup notification information.\n\n\
     [platform_data] must be non-[None] and must have the type\n\
     [G_VARIANT_TYPE_VARDICT].  If it is floating, it will be consumed."]

  method change_action_state_full : string -> Gvariant.t -> Gvariant.t -> unit
  [@@ocaml.doc
    "Changes the state of a remote action.\n\n\
     This is the same as g_action_group_change_action_state() except that\n\
     it allows for provision of \"platform data\" to be sent along with the\n\
     state change request.  This typically contains details such as the\n\
     user interaction timestamp or startup notification information.\n\n\
     [platform_data] must be non-[None] and must have the type\n\
     [G_VARIANT_TYPE_VARDICT].  If it is floating, it will be consumed."]

  (** {2:conversions Conversions} *)

  method as_remote_action_group : Raw.Remote_action_group.t
end

(* High-level class for RemoteActionGroup *)
class remote_action_group (obj : Raw.Remote_action_group.t) :
  remote_action_group_t =
  object (self)
    method activate_action_full :
        string -> Gvariant.t option -> Gvariant.t -> unit =
      fun action_name parameter platform_data ->
        Raw.Remote_action_group.activate_action_full obj action_name parameter
          platform_data

    method change_action_state_full : string -> Gvariant.t -> Gvariant.t -> unit
        =
      fun action_name value platform_data ->
        Raw.Remote_action_group.change_action_state_full obj action_name value
          platform_data

    method as_remote_action_group = obj
  end
