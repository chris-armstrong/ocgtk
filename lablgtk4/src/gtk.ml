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
end
