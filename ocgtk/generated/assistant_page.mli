(** [GtkAssistantPage] is an auxiliary object used by [GtkAssistant].

    Its methods, signals and properties are on {!class-type-assistant_page_t}.
    The functions it is built on are in {!Ocgtk.Raw.Assistant_page}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AssistantPage].}

    [GtkAssistantPage] is an auxiliary object used by [GtkAssistant]. *)
class type assistant_page_t = object
  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the child to which [page] belongs. *)

  method complete : bool
  (** Whether all required fields are filled in.

      GTK uses this information to control the sensitivity of the navigation
      buttons. *)

  method set_complete : bool -> unit
  (** Whether all required fields are filled in.

      GTK uses this information to control the sensitivity of the navigation
      buttons. *)

  method page_type : Enums.assistantpagetype
  (** The type of the assistant page. *)

  method set_page_type : Enums.assistantpagetype -> unit
  (** The type of the assistant page. *)

  method title : string
  (** The title of the page. *)

  method set_title : string -> unit
  (** The title of the page. *)

  method as_assistant_page : Raw.Assistant_page.t
end

class assistant_page : Raw.Assistant_page.t -> assistant_page_t
(** Wraps a raw handle of {!Ocgtk.Raw.Assistant_page.t}. *)
