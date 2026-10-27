(** An auxiliary class used by [GtkStack].

    Its methods, signals and properties are on {!class-type-stack_page_t}. The
    functions it is built on are in {!Ocgtk.Raw.Stack_page}. *)

(** The methods, signals and properties of a [GtkStackPage]. *)
class type stack_page_t = object
  inherit At_context_and__accessible.accessible_t

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  method get_icon_name : unit -> string option
  method get_name : unit -> string option
  method get_needs_attention : unit -> bool
  method get_title : unit -> string option
  method get_use_underline : unit -> bool
  method get_visible : unit -> bool
  method set_icon_name : string -> unit
  method set_name : string -> unit
  method set_needs_attention : bool -> unit
  method set_title : string -> unit
  method set_use_underline : bool -> unit
  method set_visible : bool -> unit
  method as_stack_page : Raw.Stack_page.t
end

class stack_page : Raw.Stack_page.t -> stack_page_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Stack_page.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkStackPage], give one already wrapped. *)
