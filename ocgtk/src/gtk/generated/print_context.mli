(* GENERATED CODE - DO NOT EDIT *)
(* PrintContext: PrintContext *)

type t = [`print_context | `object_] Gobject.obj

(* Methods *)
(** Sets a new cairo context on a print context.

This function is intended to be used when implementing
an internal print preview, it is not needed for printing,
since GTK itself creates a suitable cairo context in that
case. *)
external set_cairo_context : t -> Ocgtk_cairo.Cairo.Wrappers.Context.t -> float -> float -> unit = "ml_gtk_print_context_set_cairo_context"

(** Obtains the width of the `GtkPrintContext`, in pixels. *)
external get_width : t -> float = "ml_gtk_print_context_get_width"

(** Returns a `PangoFontMap` that is suitable for use
with the `GtkPrintContext`. *)
external get_pango_fontmap : t -> Ocgtk_pango.Pango.Wrappers.Font_map.t = "ml_gtk_print_context_get_pango_fontmap"

(** Obtains the `GtkPageSetup` that determines the page
dimensions of the `GtkPrintContext`. *)
external get_page_setup : t -> Page_setup.t = "ml_gtk_print_context_get_page_setup"

(** Obtains the height of the `GtkPrintContext`, in pixels. *)
external get_height : t -> float = "ml_gtk_print_context_get_height"

(** Obtains the hardware printer margins of the `GtkPrintContext`,
in units. *)
external get_hard_margins : t -> bool * float * float * float * float = "ml_gtk_print_context_get_hard_margins"

(** Obtains the vertical resolution of the `GtkPrintContext`,
in dots per inch. *)
external get_dpi_y : t -> float = "ml_gtk_print_context_get_dpi_y"

(** Obtains the horizontal resolution of the `GtkPrintContext`,
in dots per inch. *)
external get_dpi_x : t -> float = "ml_gtk_print_context_get_dpi_x"

(** Obtains the cairo context that is associated with the
`GtkPrintContext`. *)
external get_cairo_context : t -> Ocgtk_cairo.Cairo.Wrappers.Context.t = "ml_gtk_print_context_get_cairo_context"

(** Creates a new `PangoLayout` that is suitable for use
with the `GtkPrintContext`. *)
external create_pango_layout : t -> Ocgtk_pango.Pango.Wrappers.Layout.t = "ml_gtk_print_context_create_pango_layout"

(** Creates a new `PangoContext` that can be used with the
`GtkPrintContext`. *)
external create_pango_context : t -> Ocgtk_pango.Pango.Wrappers.Context.t = "ml_gtk_print_context_create_pango_context"

