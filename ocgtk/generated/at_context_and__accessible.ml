(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type at_context_t = object
  (** {2:signals Signals} *)

  method on_state_change :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the attributes of the accessible for the [GtkATContext]
      instance change. *)

  (** {2:methods Methods} *)

  method get_accessible : unit -> accessible_t
  (** Retrieves the [GtkAccessible] using this context. *)

  method get_accessible_role : unit -> Enums.accessiblerole
  (** Retrieves the accessible role of this context. *)

  (** {2:properties Properties} *)

  method display : Ocgdk.Display.display_t
  (** The [GdkDisplay] for the [GtkATContext]. *)

  method set_display : Ocgdk.Display.display_t -> unit
  (** The [GdkDisplay] for the [GtkATContext]. *)

  (** {2:conversions Conversions} *)

  method as_at_context : Raw.At_context.t
end

and accessible_t = object
  (** {2:methods Methods} *)

  method announce : string -> Enums.accessibleannouncementpriority -> unit
  (** Requests the user's screen reader to announce the given message.

      This kind of notification is useful for messages that either have only a
      visual representation or that are not exposed visually at all, e.g. a
      notification about a successful operation.

      Also, by using this API, you can ensure that the message does not
      interrupts the user's current screen reader output. *)

  method get_accessible_parent : unit -> accessible_t option
  (** Retrieves the accessible parent for an accessible object.

      This function returns [None] for top level widgets. *)

  method get_accessible_role : unit -> Enums.accessiblerole
  (** Retrieves the accessible role of an accessible object. *)

  method get_at_context : unit -> at_context_t
  (** Retrieves the implementation for the given accessible object. *)

  method get_first_accessible_child : unit -> accessible_t option
  (** Retrieves the first accessible child of an accessible object. *)

  method get_next_accessible_sibling : unit -> accessible_t option
  (** Retrieves the next accessible sibling of an accessible object *)

  method get_platform_state : Enums.accessibleplatformstate -> bool
  (** Queries a platform state, such as focus.

      This functionality can be overridden by [GtkAccessible] implementations,
      e.g. to get platform state from an ignored child widget, as is the case
      for [GtkText] wrappers. *)

  method reset_property : Enums.accessibleproperty -> unit
  (** Resets the accessible property to its default value. *)

  method reset_relation : Enums.accessiblerelation -> unit
  (** Resets the accessible relation to its default value. *)

  method reset_state : Enums.accessiblestate -> unit
  (** Resets the accessible state to its default value. *)

  method set_accessible_parent :
    accessible_t option -> accessible_t option -> unit
  (** Sets the parent and sibling of an accessible object.

      This function is meant to be used by accessible implementations that are
      not part of the widget hierarchy, and but act as a logical bridge between
      widgets. For instance, if a widget creates an object that holds metadata
      for each child, and you want that object to implement the [GtkAccessible]
      interface, you will use this function to ensure that the parent of each
      child widget is the metadata object, and the parent of each metadata
      object is the container widget. *)

  method update_next_accessible_sibling : accessible_t option -> unit
  (** Updates the next accessible sibling.

      That might be useful when a new child of a custom accessible is created,
      and it needs to be linked to a previous child. *)

  method update_platform_state : Enums.accessibleplatformstate -> unit
  (** Informs ATs that the platform state has changed.

      This function should be used by [GtkAccessible] implementations that have
      a platform state but are not widgets. Widgets handle platform states
      automatically. *)

  (** {2:conversions Conversions} *)

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
