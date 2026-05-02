/* test_signal_value_enum_flags_stubs.c — OCaml C stubs for enum/flags test.
 *
 * Provides a thin OCaml-callable wrapper around gtk_orientation_get_type()
 * which returns a raw GType (gulong) and must be wrapped with Val_long before
 * it can be used as an OCaml value.
 */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <gtk/gtk.h>

CAMLprim value ml_gtk_orientation_get_type(value unit)
{
    CAMLparam1(unit);
    GType t = gtk_orientation_get_type();
    CAMLreturn(Val_long((long)t));
}
