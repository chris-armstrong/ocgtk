(** An auxiliary class used by [GtkStack].

    Its methods, signals and properties are on {!class-type-stack_page_t}. The
    functions it is built on are in {!Ocgtk.Raw.Stack_page}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [StackPage].}

    An auxiliary class used by [GtkStack]. *)
class type stack_page_t = object
  inherit At_context_and__accessible.accessible_t

  (** {2:methods Methods} *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
  (** Returns the stack child to which [self] belongs. *)

  method get_icon_name : unit -> string option
  (** Returns the icon name of the page. *)

  method get_name : unit -> string option
  (** Returns the name of the page. *)

  method get_needs_attention : unit -> bool
  (** Returns whether the page is marked as “needs attention”. *)

  method get_title : unit -> string option
  (** Gets the page title. *)

  method get_use_underline : unit -> bool
  (** Gets whether underlines in the page title indicate mnemonics. *)

  method get_visible : unit -> bool
  (** Returns whether [page] is visible in its [GtkStack].

      This is independent from the [Gtk.Widget:visible] property of its widget.
  *)

  method set_icon_name : string -> unit
  (** Sets the icon name of the page. *)

  method set_name : string -> unit
  (** Sets the name of the page. *)

  method set_needs_attention : bool -> unit
  (** Sets whether the page is marked as “needs attention”. *)

  method set_title : string -> unit
  (** Sets the page title. *)

  method set_use_underline : bool -> unit
  (** Sets whether underlines in the page title indicate mnemonics. *)

  method set_visible : bool -> unit
  (** Sets whether [page] is visible in its [GtkStack]. *)

  (** {2:conversions Conversions} *)

  method as_stack_page : Raw.Stack_page.t
end

class stack_page : Raw.Stack_page.t -> stack_page_t
(** Wraps a raw handle of {!Ocgtk.Raw.Stack_page.t}. *)
