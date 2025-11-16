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

(** Orientation type *)
type orientation = [
  | `HORIZONTAL
  | `VERTICAL
]

(** Baseline position *)
type baseline_position = [
  | `TOP
  | `CENTER
  | `BOTTOM
]

(** Position type for side/position specification *)
type position_type = [
  | `LEFT
  | `RIGHT
  | `TOP
  | `BOTTOM
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

  (** {2 Event Controllers} *)

  (** Add an event controller to this widget *)
  val add_controller : t -> EventController.t -> unit

  (** Remove an event controller from this widget *)
  val remove_controller : t -> EventController.t -> unit

  (** {2 Packing Properties} *)

  (** Get horizontal expansion *)
  val get_hexpand : t -> bool

  (** Set horizontal expansion *)
  val set_hexpand : t -> bool -> unit

  (** Get vertical expansion *)
  val get_vexpand : t -> bool

  (** Set vertical expansion *)
  val set_vexpand : t -> bool -> unit

  (** Get horizontal alignment *)
  val get_halign : t -> align

  (** Set horizontal alignment *)
  val set_halign : t -> align -> unit

  (** Get vertical alignment *)
  val get_valign : t -> align

  (** Set vertical alignment *)
  val set_valign : t -> align -> unit

  (** Get start margin *)
  val get_margin_start : t -> int

  (** Set start margin *)
  val set_margin_start : t -> int -> unit

  (** Get end margin *)
  val get_margin_end : t -> int

  (** Set end margin *)
  val set_margin_end : t -> int -> unit

  (** Get top margin *)
  val get_margin_top : t -> int

  (** Set top margin *)
  val set_margin_top : t -> int -> unit

  (** Get bottom margin *)
  val get_margin_bottom : t -> int

  (** Set bottom margin *)
  val set_margin_bottom : t -> int -> unit
end

(** {1 Container Widgets} *)

module Box : sig
  type t = [`box | `widget] Gobject.obj

  (** Create a new box *)
  val create : orientation:orientation -> spacing:int -> t

  (** Add child at the end *)
  val append : t -> widget -> unit

  (** Add child at the start *)
  val prepend : t -> widget -> unit

  (** Insert child after sibling (None = at start) *)
  val insert_child_after : t -> child:widget -> sibling:widget option -> unit

  (** Remove child from box *)
  val remove : t -> widget -> unit

  (** Reorder child to position *)
  val reorder_child_after : t -> child:widget -> sibling:widget option -> unit

  (** Get spacing between children *)
  val get_spacing : t -> int

  (** Set spacing between children *)
  val set_spacing : t -> int -> unit

  (** Get homogeneous sizing *)
  val get_homogeneous : t -> bool

  (** Set homogeneous sizing *)
  val set_homogeneous : t -> bool -> unit

  (** Get baseline position *)
  val get_baseline_position : t -> baseline_position

  (** Set baseline position *)
  val set_baseline_position : t -> baseline_position -> unit

  (** Convert box to widget (simple upcast) *)
  val as_widget : t -> widget
end

module Grid : sig
  type t = [`grid | `widget] Gobject.obj

  (** Create a new grid *)
  val create : unit -> t

  (** Attach child at position *)
  val attach : t -> child:widget -> column:int -> row:int -> width:int -> height:int -> unit

  (** Attach child next to sibling *)
  val attach_next_to : t -> child:widget -> sibling:widget option -> side:position_type -> width:int -> height:int -> unit

  (** Remove child *)
  val remove : t -> widget -> unit

  (** Get child at position *)
  val get_child_at : t -> column:int -> row:int -> widget option

  (** Insert row at position *)
  val insert_row : t -> position:int -> unit

  (** Insert column at position *)
  val insert_column : t -> position:int -> unit

  (** Insert next to sibling *)
  val insert_next_to : t -> sibling:widget -> side:position_type -> unit

  (** Remove row at position *)
  val remove_row : t -> position:int -> unit

  (** Remove column at position *)
  val remove_column : t -> position:int -> unit

  (** Get row spacing *)
  val get_row_spacing : t -> int

  (** Set row spacing *)
  val set_row_spacing : t -> int -> unit

  (** Get column spacing *)
  val get_column_spacing : t -> int

  (** Set column spacing *)
  val set_column_spacing : t -> int -> unit

  (** Get row homogeneous mode *)
  val get_row_homogeneous : t -> bool

  (** Set row homogeneous mode *)
  val set_row_homogeneous : t -> bool -> unit

  (** Get column homogeneous mode *)
  val get_column_homogeneous : t -> bool

  (** Set column homogeneous mode *)
  val set_column_homogeneous : t -> bool -> unit

  (** Get baseline row *)
  val get_baseline_row : t -> int

  (** Set baseline row *)
  val set_baseline_row : t -> int -> unit

  (** Convert grid to widget (simple upcast) *)
  val as_widget : t -> widget
end
