(* GENERATED CODE - DO NOT EDIT *)
(* PrintContext: PrintContext *)

[@@@ocaml.text
"Encapsulates context information that is required when\n\
 drawing pages for printing.\n\n\
 This includes the cairo context and important parameters like page size\n\
 and resolution. It also lets you easily create [Pango.Layout] and\n\
 [Pango.Context] objects that match the font metrics of the cairo surface.\n\n\
 [GtkPrintContext] objects get passed to the\n\
 [Gtk.PrintOperation::begin-print],\n\
 [Gtk.PrintOperation::end-print],\n\
 [Gtk.PrintOperation::request-page-setup] and\n\
 [Gtk.PrintOperation::draw-page] signals on the\n\
 [Gtk.PrintOperation] object.\n\n\
 {b Using GtkPrintContext in a ::draw-page callback}\n\n\
 {[\n\
 static void\n\
 draw_page (GtkPrintOperation *operation,\n\
\           GtkPrintContext   *context,\n\
\           int                page_nr)\n\
 {\n\
\  cairo_t *cr;\n\
\  PangoLayout *layout;\n\
\  PangoFontDescription *desc;\n\n\
\  cr = gtk_print_context_get_cairo_context (context);\n\n\
\  // Draw a red rectangle, as wide as the paper (inside the margins)\n\
\  cairo_set_source_rgb (cr, 1.0, 0, 0);\n\
\  cairo_rectangle (cr, 0, 0, gtk_print_context_get_width (context), 50);\n\n\
\  cairo_fill (cr);\n\n\
\  // Draw some lines\n\
\  cairo_move_to (cr, 20, 10);\n\
\  cairo_line_to (cr, 40, 20);\n\
\  cairo_arc (cr, 60, 60, 20, 0, M_PI);\n\
\  cairo_line_to (cr, 80, 20);\n\n\
\  cairo_set_source_rgb (cr, 0, 0, 0);\n\
\  cairo_set_line_width (cr, 5);\n\
\  cairo_set_line_cap (cr, CAIRO_LINE_CAP_ROUND);\n\
\  cairo_set_line_join (cr, CAIRO_LINE_JOIN_ROUND);\n\n\
\  cairo_stroke (cr);\n\n\
\  // Draw some text\n\
\  layout = gtk_print_context_create_pango_layout (context);\n\
\  pango_layout_set_text (layout, \"Hello World! Printing is easy\", -1);\n\
\  desc = pango_font_description_from_string (\"sans 28\");\n\
\  pango_layout_set_font_description (layout, desc);\n\
\  pango_font_description_free (desc);\n\n\
\  cairo_move_to (cr, 30, 20);\n\
\  pango_cairo_layout_path (cr, layout);\n\n\
\  // Font Outline\n\
\  cairo_set_source_rgb (cr, 0.93, 1.0, 0.47);\n\
\  cairo_set_line_width (cr, 0.5);\n\
\  cairo_stroke_preserve (cr);\n\n\
\  // Font Fill\n\
\  cairo_set_source_rgb (cr, 0, 0.0, 1.0);\n\
\  cairo_fill (cr);\n\n\
\  g_object_unref (layout);\n\
 }\n\
 ]}"]

type t = [ `print_context | `object_ ] Gobject.obj

(* Methods *)

external set_cairo_context :
  t -> Ocgtk_cairo.Cairo.Wrappers.Context.t -> float -> float -> unit
  = "ml_gtk_print_context_set_cairo_context"
(** Sets a new cairo context on a print context.

    This function is intended to be used when implementing an internal print
    preview, it is not needed for printing, since GTK itself creates a suitable
    cairo context in that case. *)

external get_width : t -> float = "ml_gtk_print_context_get_width"
(** Obtains the width of the [GtkPrintContext], in pixels. *)

external get_pango_fontmap : t -> Ocgtk_pango.Pango.Wrappers.Font_map.t
  = "ml_gtk_print_context_get_pango_fontmap"
(** Returns a [PangoFontMap] that is suitable for use with the
    [GtkPrintContext]. *)

external get_page_setup : t -> Page_setup.t
  = "ml_gtk_print_context_get_page_setup"
(** Obtains the [GtkPageSetup] that determines the page dimensions of the
    [GtkPrintContext]. *)

external get_height : t -> float = "ml_gtk_print_context_get_height"
(** Obtains the height of the [GtkPrintContext], in pixels. *)

external get_hard_margins : t -> bool * float * float * float * float
  = "ml_gtk_print_context_get_hard_margins"
(** Obtains the hardware printer margins of the [GtkPrintContext], in units. *)

external get_dpi_y : t -> float = "ml_gtk_print_context_get_dpi_y"
(** Obtains the vertical resolution of the [GtkPrintContext], in dots per inch.
*)

external get_dpi_x : t -> float = "ml_gtk_print_context_get_dpi_x"
(** Obtains the horizontal resolution of the [GtkPrintContext], in dots per
    inch. *)

external get_cairo_context : t -> Ocgtk_cairo.Cairo.Wrappers.Context.t
  = "ml_gtk_print_context_get_cairo_context"
(** Obtains the cairo context that is associated with the [GtkPrintContext]. *)

external create_pango_layout : t -> Ocgtk_pango.Pango.Wrappers.Layout.t
  = "ml_gtk_print_context_create_pango_layout"
(** Creates a new [PangoLayout] that is suitable for use with the
    [GtkPrintContext]. *)

external create_pango_context : t -> Ocgtk_pango.Pango.Wrappers.Context.t
  = "ml_gtk_print_context_create_pango_context"
(** Creates a new [PangoContext] that can be used with the [GtkPrintContext]. *)
