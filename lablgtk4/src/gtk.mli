(** GTK4 Widget Base Module *)

(** Core widget type *)
type widget = [`widget] Gobject.obj

(** Widget-related types *)
type requisition = { width : int; height : int }
type allocation = { x : int; y : int; width : int; height : int }

(** Align type - to be defined in enums *)
(* For now, using a simple variant *)
type align = [
  | `FILL
  | `START
  | `END
  | `CENTER
  | `BASELINE
]

(** Size request mode *)
type size_request_mode = [
  | `HEIGHT_FOR_WIDTH
  | `WIDTH_FOR_HEIGHT
  | `CONSTANT_SIZE
]

(** State flags *)
type state_flags = [
  | `NORMAL
  | `ACTIVE
  | `PRELIGHT
  | `SELECTED
  | `INSENSITIVE
  | `INCONSISTENT
  | `FOCUSED
  | `BACKDROP
  | `DIR_LTR
  | `DIR_RTL
  | `LINK
  | `VISITED
  | `CHECKED
  | `DROP_ACTIVE
]

module Widget : sig
  type t = widget

  (** {2 Creation and destruction} *)

  (** Destroy a widget (deprecated in GTK4, but kept for compatibility) *)
  val destroy : t -> unit

  (** {2 Visibility} *)

  (** Show the widget (note: widgets are visible by default in GTK4) *)
  val show : t -> unit

  (** Hide the widget *)
  val hide : t -> unit

  (** Get visibility state *)
  val get_visible : t -> bool

  (** Set visibility state *)
  val set_visible : t -> bool -> unit

  (** {2 Size and allocation} *)

  (** Get allocated width *)
  val get_allocated_width : t -> int

  (** Get allocated height *)
  val get_allocated_height : t -> int

  (** Get width *)
  val get_width : t -> int

  (** Get height *)
  val get_height : t -> int

  (** Set size request *)
  val set_size_request : t -> width:int -> height:int -> unit

  (** Get size request *)
  val get_size_request : t -> int * int

  (** {2 Properties} *)

  (** Get sensitive state *)
  val get_sensitive : t -> bool

  (** Set sensitive state *)
  val set_sensitive : t -> bool -> unit

  (** Get widget name *)
  val get_name : t -> string

  (** Set widget name *)
  val set_name : t -> string -> unit

  (** {2 Focus} *)

  (** Get focusable property (was can_focus in GTK3) *)
  val get_focusable : t -> bool

  (** Set focusable property *)
  val set_focusable : t -> bool -> unit

  (** Check if widget has focus *)
  val has_focus : t -> bool

  (** Grab focus *)
  val grab_focus : t -> bool

  (** {2 Parent/child} *)

  (** Get parent widget *)
  val get_parent : t -> widget option

  (** Get root widget (NEW in GTK4) *)
  val get_root : t -> widget option

  (** {2 CSS and styling} *)

  (** Add a CSS class (NEW in GTK4) *)
  val add_css_class : t -> string -> unit

  (** Remove a CSS class *)
  val remove_css_class : t -> string -> unit

  (** Check if widget has a CSS class *)
  val has_css_class : t -> string -> bool

  (** Get all CSS classes *)
  val get_css_classes : t -> string list

  (** {2 State} *)

  (** Get state flags *)
  val get_state_flags : t -> state_flags list

  (** Set state flags *)
  val set_state_flags : t -> state_flags list -> clear:bool -> unit

  (** {2 Misc} *)

  (** Queue a redraw *)
  val queue_draw : t -> unit

  (** Queue a resize *)
  val queue_resize : t -> unit
end
