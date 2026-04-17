(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type at_context_t = object
  inherit Gat_context_signals.at_context_signals
  method get_accessible : unit -> accessible_t
  method get_accessible_role : unit -> Gtk_enums.accessiblerole
  method display : Ocgtk_gdk.Gdk.Display.display_t
  method set_display : Ocgtk_gdk.Gdk.Display.display_t -> unit
  method as_at_context : At_context_and__accessible.At_context.t
end

and accessible_t = object
  method announce : string -> Gtk_enums.accessibleannouncementpriority -> unit
  method get_accessible_parent : unit -> accessible_t option
  method get_accessible_role : unit -> Gtk_enums.accessiblerole
  method get_at_context : unit -> at_context_t
  method get_first_accessible_child : unit -> accessible_t option
  method get_next_accessible_sibling : unit -> accessible_t option
  method get_platform_state : Gtk_enums.accessibleplatformstate -> bool
  method reset_property : Gtk_enums.accessibleproperty -> unit
  method reset_relation : Gtk_enums.accessiblerelation -> unit
  method reset_state : Gtk_enums.accessiblestate -> unit

  method set_accessible_parent :
    accessible_t option -> accessible_t option -> unit

  method update_next_accessible_sibling : accessible_t option -> unit
  method as_accessible : At_context_and__accessible.Accessible.t
end

(* Signal class defined in gat_context_signals.ml *)

class at_context (obj : At_context_and__accessible.At_context.t) : at_context_t
  =
  object (self)
    inherit Gat_context_signals.at_context_signals obj

    method get_accessible : unit -> accessible_t =
      fun () ->
        new accessible
          (At_context_and__accessible.At_context.get_accessible obj)

    method get_accessible_role : unit -> Gtk_enums.accessiblerole =
      fun () -> At_context_and__accessible.At_context.get_accessible_role obj

    method display =
      new Ocgtk_gdk.Gdk.Display.display
        (At_context_and__accessible.At_context.get_display obj)

    method set_display : Ocgtk_gdk.Gdk.Display.display_t -> unit =
      fun v ->
        At_context_and__accessible.At_context.set_display obj v#as_display

    method as_at_context = obj
  end

and accessible (obj : At_context_and__accessible.Accessible.t) : accessible_t =
  object (self)
    method announce : string -> Gtk_enums.accessibleannouncementpriority -> unit
        =
      fun message priority ->
        At_context_and__accessible.Accessible.announce obj message priority

    method get_accessible_parent : unit -> accessible_t option =
      fun () ->
        Option.map
          (fun ret -> new accessible ret)
          (At_context_and__accessible.Accessible.get_accessible_parent obj)

    method get_accessible_role : unit -> Gtk_enums.accessiblerole =
      fun () -> At_context_and__accessible.Accessible.get_accessible_role obj

    method get_at_context : unit -> at_context_t =
      fun () ->
        new at_context
          (At_context_and__accessible.Accessible.get_at_context obj)

    method get_first_accessible_child : unit -> accessible_t option =
      fun () ->
        Option.map
          (fun ret -> new accessible ret)
          (At_context_and__accessible.Accessible.get_first_accessible_child obj)

    method get_next_accessible_sibling : unit -> accessible_t option =
      fun () ->
        Option.map
          (fun ret -> new accessible ret)
          (At_context_and__accessible.Accessible.get_next_accessible_sibling obj)

    method get_platform_state : Gtk_enums.accessibleplatformstate -> bool =
      fun state ->
        At_context_and__accessible.Accessible.get_platform_state obj state

    method reset_property : Gtk_enums.accessibleproperty -> unit =
      fun property ->
        At_context_and__accessible.Accessible.reset_property obj property

    method reset_relation : Gtk_enums.accessiblerelation -> unit =
      fun relation ->
        At_context_and__accessible.Accessible.reset_relation obj relation

    method reset_state : Gtk_enums.accessiblestate -> unit =
      fun state -> At_context_and__accessible.Accessible.reset_state obj state

    method set_accessible_parent :
        accessible_t option -> accessible_t option -> unit =
      fun parent next_sibling ->
        let parent = Option.map (fun c -> c#as_accessible) parent in
        let next_sibling = Option.map (fun c -> c#as_accessible) next_sibling in
        At_context_and__accessible.Accessible.set_accessible_parent obj parent
          next_sibling

    method update_next_accessible_sibling : accessible_t option -> unit =
      fun new_sibling ->
        let new_sibling = Option.map (fun c -> c#as_accessible) new_sibling in
        At_context_and__accessible.Accessible.update_next_accessible_sibling obj
          new_sibling

    method as_accessible = obj
  end

let create (accessible_role : Gtk_enums.accessiblerole)
    (accessible : accessible_t) (display : Ocgtk_gdk.Gdk.Display.display_t) :
    at_context_t =
  let accessible = accessible#as_accessible in
  let display = display#as_display in
  let obj_ =
    At_context_and__accessible.At_context.create accessible_role accessible
      display
  in
  new at_context obj_
