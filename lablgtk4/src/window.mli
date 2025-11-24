(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Window *)

type t = Gtk.Widget.t

(** Create a new Window *)
external new_ : unit -> t = "ml_gtk_window_new"

(* Properties *)

(** Get property: decorated *)
external get_decorated : t -> bool = "ml_gtk_window_get_decorated"

(** Set property: decorated *)
external set_decorated : t -> bool -> unit = "ml_gtk_window_set_decorated"

(** Get property: default-height *)
external get_default_height : t -> int = "ml_gtk_window_get_default_height"

(** Set property: default-height *)
external set_default_height : t -> int -> unit = "ml_gtk_window_set_default_height"

(** Get property: default-width *)
external get_default_width : t -> int = "ml_gtk_window_get_default_width"

(** Set property: default-width *)
external set_default_width : t -> int -> unit = "ml_gtk_window_set_default_width"

(** Get property: deletable *)
external get_deletable : t -> bool = "ml_gtk_window_get_deletable"

(** Set property: deletable *)
external set_deletable : t -> bool -> unit = "ml_gtk_window_set_deletable"

(** Get property: destroy-with-parent *)
external get_destroy_with_parent : t -> bool = "ml_gtk_window_get_destroy_with_parent"

(** Set property: destroy-with-parent *)
external set_destroy_with_parent : t -> bool -> unit = "ml_gtk_window_set_destroy_with_parent"

(** Get property: focus-visible *)
external get_focus_visible : t -> bool = "ml_gtk_window_get_focus_visible"

(** Set property: focus-visible *)
external set_focus_visible : t -> bool -> unit = "ml_gtk_window_set_focus_visible"

(** Get property: fullscreened *)
external get_fullscreened : t -> bool = "ml_gtk_window_get_fullscreened"

(** Set property: fullscreened *)
external set_fullscreened : t -> bool -> unit = "ml_gtk_window_set_fullscreened"

(** Get property: handle-menubar-accel *)
external get_handle_menubar_accel : t -> bool = "ml_gtk_window_get_handle_menubar_accel"

(** Set property: handle-menubar-accel *)
external set_handle_menubar_accel : t -> bool -> unit = "ml_gtk_window_set_handle_menubar_accel"

(** Get property: hide-on-close *)
external get_hide_on_close : t -> bool = "ml_gtk_window_get_hide_on_close"

(** Set property: hide-on-close *)
external set_hide_on_close : t -> bool -> unit = "ml_gtk_window_set_hide_on_close"

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_window_get_icon_name"

(** Set property: icon-name *)
external set_icon_name : t -> string -> unit = "ml_gtk_window_set_icon_name"

(** Get property: is-active *)
external get_is_active : t -> bool = "ml_gtk_window_get_is_active"

(** Get property: maximized *)
external get_maximized : t -> bool = "ml_gtk_window_get_maximized"

(** Set property: maximized *)
external set_maximized : t -> bool -> unit = "ml_gtk_window_set_maximized"

(** Get property: mnemonics-visible *)
external get_mnemonics_visible : t -> bool = "ml_gtk_window_get_mnemonics_visible"

(** Set property: mnemonics-visible *)
external set_mnemonics_visible : t -> bool -> unit = "ml_gtk_window_set_mnemonics_visible"

(** Get property: modal *)
external get_modal : t -> bool = "ml_gtk_window_get_modal"

(** Set property: modal *)
external set_modal : t -> bool -> unit = "ml_gtk_window_set_modal"

(** Get property: resizable *)
external get_resizable : t -> bool = "ml_gtk_window_get_resizable"

(** Set property: resizable *)
external set_resizable : t -> bool -> unit = "ml_gtk_window_set_resizable"

(** Get property: startup-id *)
external get_startup_id : t -> string = "ml_gtk_window_get_startup_id"

(** Set property: startup-id *)
external set_startup_id : t -> string -> unit = "ml_gtk_window_set_startup_id"

(** Get property: suspended *)
external get_suspended : t -> bool = "ml_gtk_window_get_suspended"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_window_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_window_set_title"

external unminimize : t -> unit = "ml_gtk_window_unminimize"

external unmaximize : t -> unit = "ml_gtk_window_unmaximize"

external unfullscreen : t -> unit = "ml_gtk_window_unfullscreen"

external set_transient_for : t -> Gtk.Widget.t option -> unit = "ml_gtk_window_set_transient_for"

external set_titlebar : t -> Gtk.Widget.t option -> unit = "ml_gtk_window_set_titlebar"

external set_focus : t -> Gtk.Widget.t option -> unit = "ml_gtk_window_set_focus"

external set_display : t -> unit -> unit = "ml_gtk_window_set_display"

external set_default_widget : t -> Gtk.Widget.t option -> unit = "ml_gtk_window_set_default_widget"

external set_default_size : t -> int -> int -> unit = "ml_gtk_window_set_default_size"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_window_set_child"

external set_application : t -> Gtk.Widget.t option -> unit = "ml_gtk_window_set_application"

external present_with_time : t -> unit -> unit = "ml_gtk_window_present_with_time"

external present : t -> unit = "ml_gtk_window_present"

external minimize : t -> unit = "ml_gtk_window_minimize"

external maximize : t -> unit = "ml_gtk_window_maximize"

external is_suspended : t -> bool = "ml_gtk_window_is_suspended"

external is_maximized : t -> bool = "ml_gtk_window_is_maximized"

external is_fullscreen : t -> bool = "ml_gtk_window_is_fullscreen"

external is_active : t -> bool = "ml_gtk_window_is_active"

external has_group : t -> bool = "ml_gtk_window_has_group"

external get_transient_for : t -> Gtk.Widget.t = "ml_gtk_window_get_transient_for"

external get_titlebar : t -> Gtk.Widget.t = "ml_gtk_window_get_titlebar"

external get_group : t -> Gtk.Widget.t = "ml_gtk_window_get_group"

external get_focus : t -> Gtk.Widget.t = "ml_gtk_window_get_focus"

external get_default_widget : t -> Gtk.Widget.t = "ml_gtk_window_get_default_widget"

external get_default_size : t -> int -> int -> unit = "ml_gtk_window_get_default_size"

external get_child : t -> Gtk.Widget.t = "ml_gtk_window_get_child"

external get_application : t -> Gtk.Widget.t = "ml_gtk_window_get_application"

external fullscreen_on_monitor : t -> unit -> unit = "ml_gtk_window_fullscreen_on_monitor"

external fullscreen : t -> unit = "ml_gtk_window_fullscreen"

external destroy : t -> unit = "ml_gtk_window_destroy"

external close : t -> unit = "ml_gtk_window_close"

