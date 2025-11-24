/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SectionModel */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkSectionModel */
#define GtkSectionModel_val(val) ((GtkSectionModel*)ext_of_val(val))
#define Val_GtkSectionModel(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_section_model_sections_changed(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_section_model_sections_changed(GtkSectionModel_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}
