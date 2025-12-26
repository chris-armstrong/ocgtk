/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PageSetup */

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

/* Type-specific conversion macros for GtkPageSetup */
#ifndef Val_GtkPageSetup
#define GtkPageSetup_val(val) ((GtkPageSetup*)ext_of_val(val))
#define Val_GtkPageSetup(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPageSetup */


CAMLexport CAMLprim value ml_gtk_page_setup_new(value unit)
{
CAMLparam1(unit);
GtkPageSetup *obj = gtk_page_setup_new();
CAMLreturn(Val_GtkPageSetup(obj));
}

CAMLexport CAMLprim value ml_gtk_page_setup_new_from_gvariant(value arg1)
{
CAMLparam1(arg1);
GtkPageSetup *obj = gtk_page_setup_new_from_gvariant(arg1);
CAMLreturn(Val_GtkPageSetup(obj));
}

CAMLexport CAMLprim value ml_gtk_page_setup_to_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gtk_page_setup_to_file(GtkPageSetup_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_top_margin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_page_setup_set_top_margin(GtkPageSetup_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_right_margin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_page_setup_set_right_margin(GtkPageSetup_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_paper_size_and_default_margins(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_page_setup_set_paper_size_and_default_margins(GtkPageSetup_val(self), GtkPaperSize_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_paper_size(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_page_setup_set_paper_size(GtkPageSetup_val(self), GtkPaperSize_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_page_setup_set_orientation(GtkPageSetup_val(self), GtkPageOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_left_margin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_page_setup_set_left_margin(GtkPageSetup_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_bottom_margin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_page_setup_set_bottom_margin(GtkPageSetup_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_load_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gtk_page_setup_load_file(GtkPageSetup_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_top_margin(value self, value arg1)
{
CAMLparam2(self, arg1);

double result = gtk_page_setup_get_top_margin(GtkPageSetup_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_right_margin(value self, value arg1)
{
CAMLparam2(self, arg1);

double result = gtk_page_setup_get_right_margin(GtkPageSetup_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_paper_width(value self, value arg1)
{
CAMLparam2(self, arg1);

double result = gtk_page_setup_get_paper_width(GtkPageSetup_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_paper_size(value self)
{
CAMLparam1(self);

GtkPaperSize* result = gtk_page_setup_get_paper_size(GtkPageSetup_val(self));
CAMLreturn(Val_GtkPaperSize(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_paper_height(value self, value arg1)
{
CAMLparam2(self, arg1);

double result = gtk_page_setup_get_paper_height(GtkPageSetup_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_page_width(value self, value arg1)
{
CAMLparam2(self, arg1);

double result = gtk_page_setup_get_page_width(GtkPageSetup_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_page_height(value self, value arg1)
{
CAMLparam2(self, arg1);

double result = gtk_page_setup_get_page_height(GtkPageSetup_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_orientation(value self)
{
CAMLparam1(self);

GtkPageOrientation result = gtk_page_setup_get_orientation(GtkPageSetup_val(self));
CAMLreturn(Val_GtkPageOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_left_margin(value self, value arg1)
{
CAMLparam2(self, arg1);

double result = gtk_page_setup_get_left_margin(GtkPageSetup_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_bottom_margin(value self, value arg1)
{
CAMLparam2(self, arg1);

double result = gtk_page_setup_get_bottom_margin(GtkPageSetup_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}
