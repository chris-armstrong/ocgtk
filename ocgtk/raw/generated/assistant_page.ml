(* GENERATED CODE - DO NOT EDIT *)
(* AssistantPage: AssistantPage *)

(** [GtkAssistantPage] is an auxiliary object used by [GtkAssistant].

    The class built on this module is in {!Ocgtk.Assistant_page}. *)

type t = [ `assistant_page | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_assistant_page_get_type"

(* Methods *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t = "ml_gtk_assistant_page_get_child"
(** Returns the child to which [page] belongs. *)

(* Properties *)

external get_complete : t -> bool = "ml_gtk_assistant_page_get_complete"
(** Whether all required fields are filled in.

    GTK uses this information to control the sensitivity of the navigation
    buttons. *)

external set_complete : t -> bool -> unit = "ml_gtk_assistant_page_set_complete"
(** Whether all required fields are filled in.

    GTK uses this information to control the sensitivity of the navigation
    buttons. *)

external get_page_type : t -> Ocgtk_enums.assistantpagetype
  = "ml_gtk_assistant_page_get_page_type"
(** The type of the assistant page. *)

external set_page_type : t -> Ocgtk_enums.assistantpagetype -> unit
  = "ml_gtk_assistant_page_set_page_type"
(** The type of the assistant page. *)

external get_title : t -> string = "ml_gtk_assistant_page_get_title"
(** The title of the page. *)

external set_title : t -> string -> unit = "ml_gtk_assistant_page_set_title"
(** The title of the page. *)
