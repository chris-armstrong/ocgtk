(** [GtkAssistantPage] is an auxiliary object used by [GtkAssistant].

    Its methods, signals and properties are on {!class-type-assistant_page_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Assistant_page}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [AssistantPage].}

    Inherits from: [GObject.Object]

    [GtkAssistantPage] is an auxiliary object used by [GtkAssistant]. *)
class type assistant_page_t = object
  (** {2:methods Methods} *)

  method get_child : unit -> Widget.widget_t
  (** Returns the child to which [page] belongs. *)

  (** {2:properties Properties} *)

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

  (** {2:conversions Conversions} *)

  method as_assistant_page : Raw.Assistant_page.t
end

class assistant_page : Raw.Assistant_page.t -> assistant_page_t
(** Wraps a raw handle of {!Ocgtk.Raw.Assistant_page.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
