(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class at_context (obj : Raw.At_context.t) : at_context_t =
  object (self)
    method on_state_change ?(after = false) ~callback () =
      Raw.At_context.on_state_change ~after self#as_at_context ~callback

    method get_accessible : unit -> accessible_t =
      fun () -> new accessible (Raw.At_context.get_accessible obj)

    method get_accessible_role : unit -> Enums.accessiblerole =
      fun () -> Raw.At_context.get_accessible_role obj

    method display = new Ocgdk.Display.display (Raw.At_context.get_display obj)

    method set_display : Ocgdk.Display.display_t -> unit =
      fun v -> Raw.At_context.set_display obj v#as_display

    method as_at_context = obj
  end

and accessible (obj : Raw.Accessible.t) : accessible_t =
  object (self)
    method announce : string -> Enums.accessibleannouncementpriority -> unit =
      fun message priority -> Raw.Accessible.announce obj message priority

    method get_accessible_parent : unit -> accessible_t option =
      fun () ->
        Option.map
          (fun ret -> new accessible ret)
          (Raw.Accessible.get_accessible_parent obj)

    method get_accessible_role : unit -> Enums.accessiblerole =
      fun () -> Raw.Accessible.get_accessible_role obj

    method get_at_context : unit -> at_context_t =
      fun () -> new at_context (Raw.Accessible.get_at_context obj)

    method get_first_accessible_child : unit -> accessible_t option =
      fun () ->
        Option.map
          (fun ret -> new accessible ret)
          (Raw.Accessible.get_first_accessible_child obj)

    method get_next_accessible_sibling : unit -> accessible_t option =
      fun () ->
        Option.map
          (fun ret -> new accessible ret)
          (Raw.Accessible.get_next_accessible_sibling obj)

    method get_platform_state : Enums.accessibleplatformstate -> bool =
      fun state -> Raw.Accessible.get_platform_state obj state

    method reset_property : Enums.accessibleproperty -> unit =
      fun property -> Raw.Accessible.reset_property obj property

    method reset_relation : Enums.accessiblerelation -> unit =
      fun relation -> Raw.Accessible.reset_relation obj relation

    method reset_state : Enums.accessiblestate -> unit =
      fun state -> Raw.Accessible.reset_state obj state

    method set_accessible_parent :
        accessible_t option -> accessible_t option -> unit =
      fun parent next_sibling ->
        let parent = Option.map (fun c -> c#as_accessible) parent in
        let next_sibling = Option.map (fun c -> c#as_accessible) next_sibling in
        Raw.Accessible.set_accessible_parent obj parent next_sibling

    method update_next_accessible_sibling : accessible_t option -> unit =
      fun new_sibling ->
        let new_sibling = Option.map (fun c -> c#as_accessible) new_sibling in
        Raw.Accessible.update_next_accessible_sibling obj new_sibling

    method update_platform_state : Enums.accessibleplatformstate -> unit =
      fun state -> Raw.Accessible.update_platform_state obj state

    method as_accessible = obj
  end

let create (accessible_role : Enums.accessiblerole) (accessible : accessible_t)
    (display : Ocgdk.Display.display_t) : at_context_t =
  let accessible = accessible#as_accessible in
  let display = display#as_display in
  let obj_ = Raw.At_context.create accessible_role accessible display in
  new at_context obj_
