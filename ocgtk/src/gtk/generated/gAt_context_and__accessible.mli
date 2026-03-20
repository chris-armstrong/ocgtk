
class type at_context_t = object
    inherit Gat_context_signals.at_context_signals
    method get_accessible : unit -> accessible_t
    method get_accessible_role : unit -> Gtk_enums.accessiblerole
    method display : Ocgtk_gdk.Gdk.display_t
    method set_display : Ocgtk_gdk.Gdk.display_t -> unit
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
    method as_accessible : At_context_and__accessible.Accessible.t
end


class at_context : At_context_and__accessible.At_context.t -> at_context_t

and accessible : At_context_and__accessible.Accessible.t -> accessible_t
