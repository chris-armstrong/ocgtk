/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PageSetup */

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


CAMLexport CAMLprim value ml_gtk_page_setup_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_page_setup_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_page_setup_new_from_gvariant(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_page_setup_new_from_gvariant(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_page_setup_to_key_file(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_page_setup_to_key_file(GtkWidget_val(self), arg1, (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_to_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_page_setup_to_file(GtkWidget_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_top_margin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_page_setup_set_top_margin(GtkWidget_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_right_margin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_page_setup_set_right_margin(GtkWidget_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_paper_size_and_default_margins(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_page_setup_set_paper_size_and_default_margins(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_paper_size(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_page_setup_set_paper_size(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_page_setup_set_orientation(GtkWidget_val(self), GtkPageOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_left_margin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_page_setup_set_left_margin(GtkWidget_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_set_bottom_margin(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_page_setup_set_bottom_margin(GtkWidget_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_page_setup_load_key_file(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;


    gboolean result = gtk_page_setup_load_key_file(GtkWidget_val(self), arg1, (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_page_setup_load_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_page_setup_load_file(GtkWidget_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_top_margin(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_page_setup_get_top_margin(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_right_margin(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_page_setup_get_right_margin(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_paper_width(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_page_setup_get_paper_width(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_paper_size(value self)
{
CAMLparam1(self);


    GtkPaperSize* result = gtk_page_setup_get_paper_size(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_paper_height(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_page_setup_get_paper_height(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_page_width(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_page_setup_get_page_width(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_page_height(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_page_setup_get_page_height(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_orientation(value self)
{
CAMLparam1(self);


    GtkPageOrientation result = gtk_page_setup_get_orientation(GtkWidget_val(self));
CAMLreturn(Val_GtkPageOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_left_margin(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_page_setup_get_left_margin(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_get_bottom_margin(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_page_setup_get_bottom_margin(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_page_setup_copy(value self)
{
CAMLparam1(self);


    GtkPageSetup* result = gtk_page_setup_copy(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
