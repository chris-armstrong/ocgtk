/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EveryFilter */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_every_filter_new(value unit)
{
CAMLparam1(unit);

GtkEveryFilter *obj = gtk_every_filter_new();
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GtkEveryFilter(obj));
}