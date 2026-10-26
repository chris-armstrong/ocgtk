class type at_context_t = object
  method on_state_change :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_accessible : unit -> accessible_t
  method get_accessible_role : unit -> Enums.accessiblerole
  method display : Ocgdk.Display.display_t
  method set_display : Ocgdk.Display.display_t -> unit
  method as_at_context : Raw.At_context.t
end

and accessible_t = object
  method announce : string -> Enums.accessibleannouncementpriority -> unit
  method get_accessible_parent : unit -> accessible_t option
  method get_accessible_role : unit -> Enums.accessiblerole
  method get_at_context : unit -> at_context_t
  method get_first_accessible_child : unit -> accessible_t option
  method get_next_accessible_sibling : unit -> accessible_t option
  method get_platform_state : Enums.accessibleplatformstate -> bool
  method reset_property : Enums.accessibleproperty -> unit
  method reset_relation : Enums.accessiblerelation -> unit
  method reset_state : Enums.accessiblestate -> unit

  method set_accessible_parent :
    accessible_t option -> accessible_t option -> unit

  method update_next_accessible_sibling : accessible_t option -> unit
  method update_platform_state : Enums.accessibleplatformstate -> unit
  method as_accessible : Raw.Accessible.t
end

class at_context : Raw.At_context.t -> at_context_t

and accessible : Raw.Accessible.t -> accessible_t

val create :
  Enums.accessiblerole ->
  accessible_t ->
  Ocgdk.Display.display_t ->
  at_context_t
