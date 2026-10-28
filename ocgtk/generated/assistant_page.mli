(** [GtkAssistantPage] is an auxiliary object used by [GtkAssistant].

    Its methods, signals and properties are on {!class-type-assistant_page_t}.
    The functions it is built on are in {!Ocgtk.Raw.Assistant_page}. *)

(** The methods, signals and properties of a [AssistantPage]. *)
class type assistant_page_t = object
  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the child to which [page] belongs. *)

  method complete : bool
  method set_complete : bool -> unit
  method page_type : Enums.assistantpagetype
  method set_page_type : Enums.assistantpagetype -> unit
  method title : string
  method set_title : string -> unit
  method as_assistant_page : Raw.Assistant_page.t
end

class assistant_page : Raw.Assistant_page.t -> assistant_page_t
(** Wraps a raw handle of {!Ocgtk.Raw.Assistant_page.t}. *)
