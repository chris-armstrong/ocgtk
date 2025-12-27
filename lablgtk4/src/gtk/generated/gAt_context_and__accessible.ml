(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

(* Signal class defined in gat_context_signals.ml *)

class at_context (obj : At_context_and__accessible.At_context.t) = object (self)
  inherit Gat_context_signals.at_context_signals obj

  method get_accessible : unit -> accessible =
    fun () ->
      new  accessible(At_context_and__accessible.At_context.get_accessible obj)

  method get_accessible_role : unit -> Gtk_enums.accessiblerole =
    fun () ->
      (At_context_and__accessible.At_context.get_accessible_role obj)

    method as_at_context = obj
end

and accessible (obj : At_context_and__accessible.Accessible.t) = object (self)

  method announce : string -> Gtk_enums.accessibleannouncementpriority -> unit =
    fun message priority ->
      (At_context_and__accessible.Accessible.announce obj message priority)

  method get_accessible_parent : unit -> accessible option =
    fun () ->
      Option.map (fun ret -> new accessible ret) (At_context_and__accessible.Accessible.get_accessible_parent obj)

  method get_accessible_role : unit -> Gtk_enums.accessiblerole =
    fun () ->
      (At_context_and__accessible.Accessible.get_accessible_role obj)

  method get_at_context : unit -> at_context =
    fun () ->
      new  at_context(At_context_and__accessible.Accessible.get_at_context obj)

  method get_first_accessible_child : unit -> accessible option =
    fun () ->
      Option.map (fun ret -> new accessible ret) (At_context_and__accessible.Accessible.get_first_accessible_child obj)

  method get_next_accessible_sibling : unit -> accessible option =
    fun () ->
      Option.map (fun ret -> new accessible ret) (At_context_and__accessible.Accessible.get_next_accessible_sibling obj)

  method get_platform_state : Gtk_enums.accessibleplatformstate -> bool =
    fun state ->
      (At_context_and__accessible.Accessible.get_platform_state obj state)

  method reset_property : Gtk_enums.accessibleproperty -> unit =
    fun property ->
      (At_context_and__accessible.Accessible.reset_property obj property)

  method reset_relation : Gtk_enums.accessiblerelation -> unit =
    fun relation ->
      (At_context_and__accessible.Accessible.reset_relation obj relation)

  method reset_state : Gtk_enums.accessiblestate -> unit =
    fun state ->
      (At_context_and__accessible.Accessible.reset_state obj state)

    method as_accessible = obj
end
