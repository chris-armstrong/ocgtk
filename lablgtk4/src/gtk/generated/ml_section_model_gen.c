/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SectionModel */

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

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkSectionModel */
#ifndef Val_GtkSectionModel
#define GtkSectionModel_val(val) ((GtkSectionModel*)ext_of_val(val))
#define Val_GtkSectionModel(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSectionModel */


CAMLexport CAMLprim value ml_gtk_section_model_sections_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_section_model_sections_changed(GtkSectionModel_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_section_model_get_section(value self, value arg1)
{
CAMLparam2(self, arg1);
guint out2;
guint out3;

gtk_section_model_get_section(GtkSectionModel_val(self), Int_val(arg1), &out2, &out3);
CAMLlocal1(ret);
    ret = caml_alloc(2, 0);
    Store_field(ret, 0, Val_int(out2));
    Store_field(ret, 1, Val_int(out3));
    CAMLreturn(ret);
}
