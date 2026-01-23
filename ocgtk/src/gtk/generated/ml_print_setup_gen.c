/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintSetup */

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

/* Conversion functions for GtkPrintSetup (opaque record with hidden fields) */
GtkPrintSetup *GtkPrintSetup_val(value v) {
  return *(GtkPrintSetup **)Data_custom_val(v);
}

value Val_GtkPrintSetup(const GtkPrintSetup *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkPrintSetup_option(const GtkPrintSetup *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkPrintSetup(ptr));
}


CAMLexport CAMLprim value ml_gtk_print_setup_unref(value self)
{
CAMLparam1(self);

gtk_print_setup_unref(GtkPrintSetup_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_setup_ref(value self)
{
CAMLparam1(self);

GtkPrintSetup* result = gtk_print_setup_ref(GtkPrintSetup_val(self));
CAMLreturn(Val_GtkPrintSetup(result));
}
