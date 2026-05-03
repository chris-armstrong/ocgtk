/* test_signal_value_enum_flags_stubs.c — OCaml C stubs for enum/flags test.
 *
 * Provides a thin OCaml-callable wrapper around gtk_orientation_get_type()
 * which returns a raw GType (gulong) and must be wrapped with Val_long before
 * it can be used as an OCaml value.
 *
 * Also provides ml_gdk_rectangle_get_type and ml_gdk_rectangle_create for the
 * boxed GValue round-trip test.  ml_gdk_rectangle_create wraps a freshly-heap-
 * allocated GdkRectangle via ml_gir_record_val_ptr_with_type (CAMLexport from
 * wrappers.c, part of ocgtk.common) which attaches the gdk_rectangle_get_type()
 * GType so the gir_record finalizer calls g_boxed_free correctly.
 */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <gtk/gtk.h>

/* Forward-declare ml_gir_record_val_ptr_with_type from wrappers.c (ocgtk.common).
 * The function is marked CAMLexport and linked in at test-link time. */
extern value ml_gir_record_val_ptr_with_type(GType type, const void *src);

CAMLprim value ml_gtk_orientation_get_type(value unit)
{
    CAMLparam1(unit);
    GType t = gtk_orientation_get_type();
    CAMLreturn(Val_long((long)t));
}

CAMLprim value ml_gdk_rectangle_get_type(value unit)
{
    CAMLparam1(unit);
    GType t = gdk_rectangle_get_type();
    CAMLreturn(Val_long((long)t));
}

/* Create a GdkRectangle with the given x, y, width, height fields and wrap it
 * as a gir_record custom block whose GType is gdk_rectangle_get_type().  The
 * data is heap-allocated via g_new so that the gir_record finalizer can free it
 * with g_boxed_free (which calls gdk_rectangle_free internally). */
CAMLprim value ml_gdk_rectangle_create(value x_v, value y_v, value w_v, value h_v)
{
    CAMLparam4(x_v, y_v, w_v, h_v);
    GdkRectangle *r = g_new(GdkRectangle, 1);
    if (r == NULL) caml_raise_out_of_memory();
    r->x      = Int_val(x_v);
    r->y      = Int_val(y_v);
    r->width  = Int_val(w_v);
    r->height = Int_val(h_v);
    CAMLreturn(ml_gir_record_val_ptr_with_type(gdk_rectangle_get_type(), r));
}
