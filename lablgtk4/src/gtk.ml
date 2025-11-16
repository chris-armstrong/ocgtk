(** GTK4 Widget Base Module *)

(** Core widget type *)
type widget = [`widget] Gobject.obj

(** Widget-related types *)
type requisition = { width : int; height : int }
type allocation = { x : int; y : int; width : int; height : int }

(** Align type *)
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

(** Stack transition type *)
type stack_transition_type = [
  | `NONE
  | `CROSSFADE
  | `SLIDE_RIGHT
  | `SLIDE_LEFT
  | `SLIDE_UP
  | `SLIDE_DOWN
  | `SLIDE_LEFT_RIGHT
  | `SLIDE_UP_DOWN
  | `OVER_UP
  | `OVER_DOWN
  | `OVER_LEFT
  | `OVER_RIGHT
  | `UNDER_UP
  | `UNDER_DOWN
  | `UNDER_LEFT
  | `UNDER_RIGHT
  | `OVER_UP_DOWN
  | `OVER_DOWN_UP
  | `OVER_LEFT_RIGHT
  | `OVER_RIGHT_LEFT
  | `ROTATE_LEFT
  | `ROTATE_RIGHT
  | `ROTATE_LEFT_RIGHT
]

module Widget = struct
  type t = widget

  (** {2 External C bindings} *)

  external destroy : t -> unit = "ml_gtk_widget_destroy"

  external show : t -> unit = "ml_gtk_widget_show"
  external hide : t -> unit = "ml_gtk_widget_hide"
  external get_visible : t -> bool = "ml_gtk_widget_get_visible"
  external set_visible : t -> bool -> unit = "ml_gtk_widget_set_visible"

  external get_allocated_width : t -> int = "ml_gtk_widget_get_allocated_width"
  external get_allocated_height : t -> int = "ml_gtk_widget_get_allocated_height"
  external get_width : t -> int = "ml_gtk_widget_get_width"
  external get_height : t -> int = "ml_gtk_widget_get_height"
  external set_size_request : t -> width:int -> height:int -> unit = "ml_gtk_widget_set_size_request"
  external get_size_request : t -> int * int = "ml_gtk_widget_get_size_request"

  external get_sensitive : t -> bool = "ml_gtk_widget_get_sensitive"
  external set_sensitive : t -> bool -> unit = "ml_gtk_widget_set_sensitive"
  external get_name : t -> string = "ml_gtk_widget_get_name"
  external set_name : t -> string -> unit = "ml_gtk_widget_set_name"

  external get_focusable : t -> bool = "ml_gtk_widget_get_focusable"
  external set_focusable : t -> bool -> unit = "ml_gtk_widget_set_focusable"
  external has_focus : t -> bool = "ml_gtk_widget_has_focus"
  external grab_focus : t -> bool = "ml_gtk_widget_grab_focus"

  external get_parent : t -> widget option = "ml_gtk_widget_get_parent"
  external get_root : t -> widget option = "ml_gtk_widget_get_root"

  external add_css_class : t -> string -> unit = "ml_gtk_widget_add_css_class"
  external remove_css_class : t -> string -> unit = "ml_gtk_widget_remove_css_class"
  external has_css_class : t -> string -> bool = "ml_gtk_widget_has_css_class"
  external get_css_classes : t -> string list = "ml_gtk_widget_get_css_classes"

  external get_state_flags_impl : t -> int = "ml_gtk_widget_get_state_flags"
  external set_state_flags_impl : t -> int -> bool -> unit = "ml_gtk_widget_set_state_flags"

  external queue_draw : t -> unit = "ml_gtk_widget_queue_draw"
  external queue_resize : t -> unit = "ml_gtk_widget_queue_resize"

  external add_controller : t -> EventController.t -> unit = "ml_gtk_widget_add_controller"
  external remove_controller : t -> EventController.t -> unit = "ml_gtk_widget_remove_controller"

  (** {2 Packing Properties} *)

  external get_hexpand : t -> bool = "ml_gtk_widget_get_hexpand"
  external set_hexpand : t -> bool -> unit = "ml_gtk_widget_set_hexpand"
  external get_vexpand : t -> bool = "ml_gtk_widget_get_vexpand"
  external set_vexpand : t -> bool -> unit = "ml_gtk_widget_set_vexpand"

  external get_halign_impl : t -> int = "ml_gtk_widget_get_halign"
  external set_halign_impl : t -> int -> unit = "ml_gtk_widget_set_halign"
  external get_valign_impl : t -> int = "ml_gtk_widget_get_valign"
  external set_valign_impl : t -> int -> unit = "ml_gtk_widget_set_valign"

  external get_margin_start : t -> int = "ml_gtk_widget_get_margin_start"
  external set_margin_start : t -> int -> unit = "ml_gtk_widget_set_margin_start"
  external get_margin_end : t -> int = "ml_gtk_widget_get_margin_end"
  external set_margin_end : t -> int -> unit = "ml_gtk_widget_set_margin_end"
  external get_margin_top : t -> int = "ml_gtk_widget_get_margin_top"
  external set_margin_top : t -> int -> unit = "ml_gtk_widget_set_margin_top"
  external get_margin_bottom : t -> int = "ml_gtk_widget_get_margin_bottom"
  external set_margin_bottom : t -> int -> unit = "ml_gtk_widget_set_margin_bottom"

  (** {2 Helper functions} *)

  (* Convert state flags to/from int representation *)
  let state_flag_to_int = function
    | `NORMAL -> 0
    | `ACTIVE -> 1
    | `PRELIGHT -> 2
    | `SELECTED -> 4
    | `INSENSITIVE -> 8
    | `INCONSISTENT -> 16
    | `FOCUSED -> 32
    | `BACKDROP -> 64
    | `DIR_LTR -> 128
    | `DIR_RTL -> 256
    | `LINK -> 512
    | `VISITED -> 1024
    | `CHECKED -> 2048
    | `DROP_ACTIVE -> 4096

  let state_flags_to_int flags =
    List.fold_left (fun acc flag -> acc lor (state_flag_to_int flag)) 0 flags

  let int_to_state_flags value =
    let flags = [
      (`NORMAL, 0);
      (`ACTIVE, 1);
      (`PRELIGHT, 2);
      (`SELECTED, 4);
      (`INSENSITIVE, 8);
      (`INCONSISTENT, 16);
      (`FOCUSED, 32);
      (`BACKDROP, 64);
      (`DIR_LTR, 128);
      (`DIR_RTL, 256);
      (`LINK, 512);
      (`VISITED, 1024);
      (`CHECKED, 2048);
      (`DROP_ACTIVE, 4096);
    ] in
    List.filter_map (fun (flag, bit) ->
      if value land bit <> 0 then Some flag else None
    ) flags

  let get_state_flags widget =
    int_to_state_flags (get_state_flags_impl widget)

  let set_state_flags widget flags ~clear =
    set_state_flags_impl widget (state_flags_to_int flags) clear

  (* Convert align to/from int representation *)
  let align_to_int = function
    | `FILL -> 0
    | `START -> 1
    | `END -> 2
    | `CENTER -> 3
    | `BASELINE -> 4

  let int_to_align = function
    | 0 -> `FILL
    | 1 -> `START
    | 2 -> `END
    | 3 -> `CENTER
    | 4 -> `BASELINE
    | _ -> `FILL  (* default *)

  let get_halign widget =
    int_to_align (get_halign_impl widget)

  let set_halign widget align =
    set_halign_impl widget (align_to_int align)

  let get_valign widget =
    int_to_align (get_valign_impl widget)

  let set_valign widget align =
    set_valign_impl widget (align_to_int align)
end

(** {1 Container Widgets} *)

module Box = struct
  type t = [`box | `widget] Gobject.obj

  (** {2 External C bindings} *)

  external create_impl : int -> int -> t = "ml_gtk_box_new"
  external append : t -> widget -> unit = "ml_gtk_box_append"
  external prepend : t -> widget -> unit = "ml_gtk_box_prepend"
  external insert_child_after_impl : t -> widget -> widget option -> unit = "ml_gtk_box_insert_child_after"
  external remove : t -> widget -> unit = "ml_gtk_box_remove"
  external reorder_child_after_impl : t -> widget -> widget option -> unit = "ml_gtk_box_reorder_child_after"
  external get_spacing : t -> int = "ml_gtk_box_get_spacing"
  external set_spacing : t -> int -> unit = "ml_gtk_box_set_spacing"
  external get_homogeneous : t -> bool = "ml_gtk_box_get_homogeneous"
  external set_homogeneous : t -> bool -> unit = "ml_gtk_box_set_homogeneous"
  external get_baseline_position_impl : t -> int = "ml_gtk_box_get_baseline_position"
  external set_baseline_position_impl : t -> int -> unit = "ml_gtk_box_set_baseline_position"

  (** {2 Helper functions} *)

  (* Convert orientation to/from int *)
  let orientation_to_int = function
    | `HORIZONTAL -> 0
    | `VERTICAL -> 1

  let int_to_orientation = function
    | 0 -> `HORIZONTAL
    | 1 -> `VERTICAL
    | _ -> `HORIZONTAL  (* default *)

  (* Convert baseline_position to/from int *)
  let baseline_position_to_int = function
    | `TOP -> 0
    | `CENTER -> 1
    | `BOTTOM -> 2

  let int_to_baseline_position = function
    | 0 -> `TOP
    | 1 -> `CENTER
    | 2 -> `BOTTOM
    | _ -> `CENTER  (* default *)

  (** {2 Wrapped functions} *)

  let create ~orientation ~spacing =
    create_impl (orientation_to_int orientation) spacing

  let insert_child_after box ~child ~sibling =
    insert_child_after_impl box child sibling

  let reorder_child_after box ~child ~sibling =
    reorder_child_after_impl box child sibling

  let get_baseline_position box =
    int_to_baseline_position (get_baseline_position_impl box)

  let set_baseline_position box pos =
    set_baseline_position_impl box (baseline_position_to_int pos)

  (* Convert to widget - uses Obj.magic since [`box | `widget] can't be coerced to [`widget] *)
  let as_widget (box : t) : widget = Obj.magic box
end

module Grid = struct
  type t = [`grid | `widget] Gobject.obj

  (** {2 External C bindings} *)

  external create : unit -> t = "ml_gtk_grid_new"
  external attach_impl : t -> widget -> int -> int -> int -> int -> unit = "ml_gtk_grid_attach_bc" "ml_gtk_grid_attach"
  external attach_next_to_impl : t -> widget -> widget option -> int -> int -> int -> unit = "ml_gtk_grid_attach_next_to_bc" "ml_gtk_grid_attach_next_to"
  external remove : t -> widget -> unit = "ml_gtk_grid_remove"
  external get_child_at_impl : t -> int -> int -> widget option = "ml_gtk_grid_get_child_at"
  external insert_row : t -> int -> unit = "ml_gtk_grid_insert_row"
  external insert_column : t -> int -> unit = "ml_gtk_grid_insert_column"
  external insert_next_to_impl : t -> widget -> int -> unit = "ml_gtk_grid_insert_next_to"
  external remove_row : t -> int -> unit = "ml_gtk_grid_remove_row"
  external remove_column : t -> int -> unit = "ml_gtk_grid_remove_column"
  external get_row_spacing : t -> int = "ml_gtk_grid_get_row_spacing"
  external set_row_spacing : t -> int -> unit = "ml_gtk_grid_set_row_spacing"
  external get_column_spacing : t -> int = "ml_gtk_grid_get_column_spacing"
  external set_column_spacing : t -> int -> unit = "ml_gtk_grid_set_column_spacing"
  external get_row_homogeneous : t -> bool = "ml_gtk_grid_get_row_homogeneous"
  external set_row_homogeneous : t -> bool -> unit = "ml_gtk_grid_set_row_homogeneous"
  external get_column_homogeneous : t -> bool = "ml_gtk_grid_get_column_homogeneous"
  external set_column_homogeneous : t -> bool -> unit = "ml_gtk_grid_set_column_homogeneous"
  external get_baseline_row : t -> int = "ml_gtk_grid_get_baseline_row"
  external set_baseline_row : t -> int -> unit = "ml_gtk_grid_set_baseline_row"

  (** {2 Helper functions} *)

  (* Convert position_type to/from int *)
  let position_type_to_int = function
    | `LEFT -> 0
    | `RIGHT -> 1
    | `TOP -> 2
    | `BOTTOM -> 3

  let int_to_position_type = function
    | 0 -> `LEFT
    | 1 -> `RIGHT
    | 2 -> `TOP
    | 3 -> `BOTTOM
    | _ -> `LEFT  (* default *)

  (** {2 Wrapped functions} *)

  let attach grid ~child ~column ~row ~width ~height =
    attach_impl grid child column row width height

  let attach_next_to grid ~child ~sibling ~side ~width ~height =
    attach_next_to_impl grid child sibling (position_type_to_int side) width height

  let get_child_at grid ~column ~row =
    get_child_at_impl grid column row

  let insert_next_to grid ~sibling ~side =
    insert_next_to_impl grid sibling (position_type_to_int side)

  (* Convert to widget - uses Obj.magic since [`grid | `widget] can't be coerced to [`widget] *)
  let as_widget (grid : t) : widget = Obj.magic grid
end

module Fixed = struct
  type t = [`fixed | `widget] Gobject.obj

  (** {2 External C bindings} *)

  external create : unit -> t = "ml_gtk_fixed_new"
  external put_impl : t -> widget -> float -> float -> unit = "ml_gtk_fixed_put"
  external remove : t -> widget -> unit = "ml_gtk_fixed_remove"
  external move_impl : t -> widget -> float -> float -> unit = "ml_gtk_fixed_move"
  external get_child_position_impl : t -> widget -> float * float = "ml_gtk_fixed_get_child_position"

  (** {2 Wrapped functions} *)

  let put fixed widget ~x ~y =
    put_impl fixed widget x y

  let move fixed widget ~x ~y =
    move_impl fixed widget x y

  let get_child_position fixed widget =
    get_child_position_impl fixed widget

  let as_widget (fixed : t) : widget = Obj.magic fixed
end

module Paned = struct
  type t = [`paned | `widget] Gobject.obj

  (** {2 External C bindings} *)

  external create_impl : int -> t = "ml_gtk_paned_new"
  external set_start_child : t -> widget option -> unit = "ml_gtk_paned_set_start_child"
  external get_start_child : t -> widget option = "ml_gtk_paned_get_start_child"
  external set_end_child : t -> widget option -> unit = "ml_gtk_paned_set_end_child"
  external get_end_child : t -> widget option = "ml_gtk_paned_get_end_child"
  external set_position : t -> int -> unit = "ml_gtk_paned_set_position"
  external get_position : t -> int = "ml_gtk_paned_get_position"
  external set_wide_handle : t -> bool -> unit = "ml_gtk_paned_set_wide_handle"
  external get_wide_handle : t -> bool = "ml_gtk_paned_get_wide_handle"
  external set_resize_start_child : t -> bool -> unit = "ml_gtk_paned_set_resize_start_child"
  external get_resize_start_child : t -> bool = "ml_gtk_paned_get_resize_start_child"
  external set_resize_end_child : t -> bool -> unit = "ml_gtk_paned_set_resize_end_child"
  external get_resize_end_child : t -> bool = "ml_gtk_paned_get_resize_end_child"
  external set_shrink_start_child : t -> bool -> unit = "ml_gtk_paned_set_shrink_start_child"
  external get_shrink_start_child : t -> bool = "ml_gtk_paned_get_shrink_start_child"
  external set_shrink_end_child : t -> bool -> unit = "ml_gtk_paned_set_shrink_end_child"
  external get_shrink_end_child : t -> bool = "ml_gtk_paned_get_shrink_end_child"

  (** {2 Helper functions} *)

  (* Convert orientation to/from int *)
  let orientation_to_int = function
    | `HORIZONTAL -> 0
    | `VERTICAL -> 1

  let create ~orientation =
    create_impl (orientation_to_int orientation)

  let as_widget (paned : t) : widget = Obj.magic paned
end

module Notebook = struct
  type t = [`notebook | `widget] Gobject.obj

  (** {2 External C bindings} *)

  external create : unit -> t = "ml_gtk_notebook_new"
  external append_page_impl : t -> widget -> widget option -> int = "ml_gtk_notebook_append_page"
  external prepend_page_impl : t -> widget -> widget option -> int = "ml_gtk_notebook_prepend_page"
  external insert_page_impl : t -> widget -> widget option -> int -> int = "ml_gtk_notebook_insert_page"
  external remove_page : t -> int -> unit = "ml_gtk_notebook_remove_page"
  external detach_tab : t -> widget -> unit = "ml_gtk_notebook_detach_tab"
  external get_current_page : t -> int = "ml_gtk_notebook_get_current_page"
  external set_current_page : t -> int -> unit = "ml_gtk_notebook_set_current_page"
  external next_page : t -> unit = "ml_gtk_notebook_next_page"
  external prev_page : t -> unit = "ml_gtk_notebook_prev_page"
  external get_nth_page : t -> int -> widget option = "ml_gtk_notebook_get_nth_page"
  external get_n_pages : t -> int = "ml_gtk_notebook_get_n_pages"
  external page_num : t -> widget -> int = "ml_gtk_notebook_page_num"
  external set_show_tabs : t -> bool -> unit = "ml_gtk_notebook_set_show_tabs"
  external get_show_tabs : t -> bool = "ml_gtk_notebook_get_show_tabs"
  external set_show_border : t -> bool -> unit = "ml_gtk_notebook_set_show_border"
  external get_show_border : t -> bool = "ml_gtk_notebook_get_show_border"
  external set_scrollable : t -> bool -> unit = "ml_gtk_notebook_set_scrollable"
  external get_scrollable : t -> bool = "ml_gtk_notebook_get_scrollable"

  (** {2 Wrapped functions} *)

  let append_page notebook ~child ?tab_label () =
    append_page_impl notebook child tab_label

  let prepend_page notebook ~child ?tab_label () =
    prepend_page_impl notebook child tab_label

  let insert_page notebook ~child ?tab_label ~position () =
    insert_page_impl notebook child tab_label position

  let as_widget (notebook : t) : widget = Obj.magic notebook
end

module Stack = struct
  type t = [`stack | `widget] Gobject.obj

  (** {2 External C bindings} *)

  external create : unit -> t = "ml_gtk_stack_new"
  external add_named_impl : t -> widget -> string -> unit = "ml_gtk_stack_add_named"
  external add_titled_impl : t -> widget -> string -> string -> unit = "ml_gtk_stack_add_titled"
  external add_child : t -> widget -> unit = "ml_gtk_stack_add_child"
  external remove : t -> widget -> unit = "ml_gtk_stack_remove"
  external get_visible_child : t -> widget option = "ml_gtk_stack_get_visible_child"
  external set_visible_child : t -> widget -> unit = "ml_gtk_stack_set_visible_child"
  external set_visible_child_name : t -> string -> unit = "ml_gtk_stack_set_visible_child_name"
  external get_visible_child_name : t -> string option = "ml_gtk_stack_get_visible_child_name"
  external set_transition_type_impl : t -> int -> unit = "ml_gtk_stack_set_transition_type"
  external get_transition_type_impl : t -> int = "ml_gtk_stack_get_transition_type"
  external set_transition_duration : t -> int -> unit = "ml_gtk_stack_set_transition_duration"
  external get_transition_duration : t -> int = "ml_gtk_stack_get_transition_duration"

  (** {2 Helper functions} *)

  let stack_transition_type_to_int = function
    | `NONE -> 0
    | `CROSSFADE -> 1
    | `SLIDE_RIGHT -> 2
    | `SLIDE_LEFT -> 3
    | `SLIDE_UP -> 4
    | `SLIDE_DOWN -> 5
    | `SLIDE_LEFT_RIGHT -> 6
    | `SLIDE_UP_DOWN -> 7
    | `OVER_UP -> 8
    | `OVER_DOWN -> 9
    | `OVER_LEFT -> 10
    | `OVER_RIGHT -> 11
    | `UNDER_UP -> 12
    | `UNDER_DOWN -> 13
    | `UNDER_LEFT -> 14
    | `UNDER_RIGHT -> 15
    | `OVER_UP_DOWN -> 16
    | `OVER_DOWN_UP -> 17
    | `OVER_LEFT_RIGHT -> 18
    | `OVER_RIGHT_LEFT -> 19
    | `ROTATE_LEFT -> 20
    | `ROTATE_RIGHT -> 21
    | `ROTATE_LEFT_RIGHT -> 22

  let int_to_stack_transition_type = function
    | 0 -> `NONE
    | 1 -> `CROSSFADE
    | 2 -> `SLIDE_RIGHT
    | 3 -> `SLIDE_LEFT
    | 4 -> `SLIDE_UP
    | 5 -> `SLIDE_DOWN
    | 6 -> `SLIDE_LEFT_RIGHT
    | 7 -> `SLIDE_UP_DOWN
    | 8 -> `OVER_UP
    | 9 -> `OVER_DOWN
    | 10 -> `OVER_LEFT
    | 11 -> `OVER_RIGHT
    | 12 -> `UNDER_UP
    | 13 -> `UNDER_DOWN
    | 14 -> `UNDER_LEFT
    | 15 -> `UNDER_RIGHT
    | 16 -> `OVER_UP_DOWN
    | 17 -> `OVER_DOWN_UP
    | 18 -> `OVER_LEFT_RIGHT
    | 19 -> `OVER_RIGHT_LEFT
    | 20 -> `ROTATE_LEFT
    | 21 -> `ROTATE_RIGHT
    | 22 -> `ROTATE_LEFT_RIGHT
    | _ -> `NONE

  (** {2 Wrapped functions} *)

  let add_named stack ~child ~name =
    add_named_impl stack child name

  let add_titled stack ~child ~name ~title =
    add_titled_impl stack child name title

  let set_transition_type stack tt =
    set_transition_type_impl stack (stack_transition_type_to_int tt)

  let get_transition_type stack =
    int_to_stack_transition_type (get_transition_type_impl stack)

  let as_widget (stack : t) : widget = Obj.magic stack
end
