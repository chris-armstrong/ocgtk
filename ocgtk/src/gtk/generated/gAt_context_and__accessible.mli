class at_context : At_context_and__accessible.At_context.t ->
  object
    inherit Gat_context_signals.at_context_signals
    method get_accessible : unit -> accessible
    method get_accessible_role : unit -> Gtk_enums.accessiblerole
    method as_at_context : At_context_and__accessible.At_context.t
  end

and accessible : At_context_and__accessible.Accessible.t ->
  object
    method announce : string -> Gtk_enums.accessibleannouncementpriority -> unit
    method get_accessible_parent : unit -> accessible option
    method get_accessible_role : unit -> Gtk_enums.accessiblerole
    method get_at_context : unit -> at_context
    method get_first_accessible_child : unit -> accessible option
    method get_next_accessible_sibling : unit -> accessible option
    method get_platform_state : Gtk_enums.accessibleplatformstate -> bool
    method reset_property : Gtk_enums.accessibleproperty -> unit
    method reset_relation : Gtk_enums.accessiblerelation -> unit
    method reset_state : Gtk_enums.accessiblestate -> unit
    method as_accessible : At_context_and__accessible.Accessible.t
  end
