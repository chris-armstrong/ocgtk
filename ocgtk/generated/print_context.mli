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
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-print_context_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Print_context}."]

(** The methods, signals and properties of a [GtkPrintContext]. *)
class type print_context_t = object
  method create_pango_context : unit -> Ocpango.Context.context_t
  (** Creates a new [PangoContext] that can be used with the [GtkPrintContext].
  *)

  method create_pango_layout : unit -> Ocpango.Layout.layout_t
  (** Creates a new [PangoLayout] that is suitable for use with the
      [GtkPrintContext]. *)

  method get_cairo_context : unit -> Occairo.Context.context_t
  (** Obtains the cairo context that is associated with the [GtkPrintContext].
  *)

  method get_dpi_x : unit -> float
  (** Obtains the horizontal resolution of the [GtkPrintContext], in dots per
      inch. *)

  method get_dpi_y : unit -> float
  (** Obtains the vertical resolution of the [GtkPrintContext], in dots per
      inch. *)

  method get_height : unit -> float
  (** Obtains the height of the [GtkPrintContext], in pixels. *)

  method get_page_setup : unit -> Page_setup.page_setup_t
  (** Obtains the [GtkPageSetup] that determines the page dimensions of the
      [GtkPrintContext]. *)

  method get_pango_fontmap : unit -> Ocpango.Font_map.font_map_t
  (** Returns a [PangoFontMap] that is suitable for use with the
      [GtkPrintContext]. *)

  method get_width : unit -> float
  (** Obtains the width of the [GtkPrintContext], in pixels. *)

  method set_cairo_context : Occairo.Context.context_t -> float -> float -> unit
  (** Sets a new cairo context on a print context.

      This function is intended to be used when implementing an internal print
      preview, it is not needed for printing, since GTK itself creates a
      suitable cairo context in that case. *)

  method as_print_context : Raw.Print_context.t
end

class print_context : Raw.Print_context.t -> print_context_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Print_context.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkPrintContext], give one already wrapped. *)
