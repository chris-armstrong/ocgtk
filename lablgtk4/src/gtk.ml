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
