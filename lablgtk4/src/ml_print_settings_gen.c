/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintSettings */

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


CAMLexport CAMLprim value ml_gtk_print_settings_new(value unit)
{
CAMLparam1(unit);
GtkWidget *widget = gtk_print_settings_new();
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_print_settings_new_from_gvariant(value arg1)
{
CAMLparam1(arg1);
GtkWidget *widget = gtk_print_settings_new_from_gvariant(arg1);
CAMLreturn(Val_GtkWidget(widget));
}

CAMLexport CAMLprim value ml_gtk_print_settings_unset(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_unset(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_to_key_file(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_to_key_file(GtkWidget_val(self), arg1, (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_to_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_print_settings_to_file(GtkWidget_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_use_color(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_use_color(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_scale(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_scale(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_reverse(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_reverse(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_resolution_xy(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_set_resolution_xy(GtkWidget_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_resolution(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_resolution(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_quality(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_quality(GtkWidget_val(self), GtkPrintQuality_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_printer_lpi(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_printer_lpi(GtkWidget_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_printer(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_printer(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_print_pages(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_print_pages(GtkWidget_val(self), GtkPrintPages_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_paper_width(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_set_paper_width(GtkWidget_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_paper_size(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_paper_size(GtkWidget_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_paper_height(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_set_paper_height(GtkWidget_val(self), Double_val(arg1), GtkUnit_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_page_set(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_page_set(GtkWidget_val(self), GtkPageSet_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_page_ranges(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_set_page_ranges(GtkWidget_val(self), arg1, Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_output_bin(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_output_bin(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_orientation(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_orientation(GtkWidget_val(self), GtkPageOrientation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_number_up_layout(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_number_up_layout(GtkWidget_val(self), GtkNumberUpLayout_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_number_up(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_number_up(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_n_copies(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_n_copies(GtkWidget_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_media_type(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_media_type(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_length(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_print_settings_set_length(GtkWidget_val(self), String_val(arg1), Double_val(arg2), GtkUnit_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_int(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_set_int(GtkWidget_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_finishings(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_finishings(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_duplex(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_duplex(GtkWidget_val(self), GtkPrintDuplex_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_double(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_set_double(GtkWidget_val(self), String_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_dither(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_dither(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_default_source(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_default_source(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_collate(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_set_collate(GtkWidget_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set_bool(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_set_bool(GtkWidget_val(self), String_val(arg1), Bool_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_set(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_set(GtkWidget_val(self), String_val(arg1), (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_load_key_file(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;


    gboolean result = gtk_print_settings_load_key_file(GtkWidget_val(self), arg1, (Is_some(arg2) ? String_val(Some_val(arg2)) : NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_print_settings_load_file(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;


    gboolean result = gtk_print_settings_load_file(GtkWidget_val(self), String_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_print_settings_has_key(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_print_settings_has_key(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_use_color(value self)
{
CAMLparam1(self);


    gboolean result = gtk_print_settings_get_use_color(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_scale(value self)
{
CAMLparam1(self);


    double result = gtk_print_settings_get_scale(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_reverse(value self)
{
CAMLparam1(self);


    gboolean result = gtk_print_settings_get_reverse(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_resolution_y(value self)
{
CAMLparam1(self);


    int result = gtk_print_settings_get_resolution_y(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_resolution_x(value self)
{
CAMLparam1(self);


    int result = gtk_print_settings_get_resolution_x(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_resolution(value self)
{
CAMLparam1(self);


    int result = gtk_print_settings_get_resolution(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_quality(value self)
{
CAMLparam1(self);


    GtkPrintQuality result = gtk_print_settings_get_quality(GtkWidget_val(self));
CAMLreturn(Val_GtkPrintQuality(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_printer_lpi(value self)
{
CAMLparam1(self);


    double result = gtk_print_settings_get_printer_lpi(GtkWidget_val(self));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_printer(value self)
{
CAMLparam1(self);


    const char* result = gtk_print_settings_get_printer(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_print_pages(value self)
{
CAMLparam1(self);


    GtkPrintPages result = gtk_print_settings_get_print_pages(GtkWidget_val(self));
CAMLreturn(Val_GtkPrintPages(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_paper_width(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_print_settings_get_paper_width(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_paper_size(value self)
{
CAMLparam1(self);


    GtkPaperSize* result = gtk_print_settings_get_paper_size(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_paper_height(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_print_settings_get_paper_height(GtkWidget_val(self), GtkUnit_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_page_set(value self)
{
CAMLparam1(self);


    GtkPageSet result = gtk_print_settings_get_page_set(GtkWidget_val(self));
CAMLreturn(Val_GtkPageSet(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_page_ranges(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_settings_get_page_ranges(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_output_bin(value self)
{
CAMLparam1(self);


    const char* result = gtk_print_settings_get_output_bin(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_orientation(value self)
{
CAMLparam1(self);


    GtkPageOrientation result = gtk_print_settings_get_orientation(GtkWidget_val(self));
CAMLreturn(Val_GtkPageOrientation(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_number_up_layout(value self)
{
CAMLparam1(self);


    GtkNumberUpLayout result = gtk_print_settings_get_number_up_layout(GtkWidget_val(self));
CAMLreturn(Val_GtkNumberUpLayout(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_number_up(value self)
{
CAMLparam1(self);


    int result = gtk_print_settings_get_number_up(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_n_copies(value self)
{
CAMLparam1(self);


    int result = gtk_print_settings_get_n_copies(GtkWidget_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_media_type(value self)
{
CAMLparam1(self);


    const char* result = gtk_print_settings_get_media_type(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_length(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    double result = gtk_print_settings_get_length(GtkWidget_val(self), String_val(arg1), GtkUnit_val(arg2));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_int_with_default(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    int result = gtk_print_settings_get_int_with_default(GtkWidget_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_int(value self, value arg1)
{
CAMLparam2(self, arg1);


    int result = gtk_print_settings_get_int(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_finishings(value self)
{
CAMLparam1(self);


    const char* result = gtk_print_settings_get_finishings(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_duplex(value self)
{
CAMLparam1(self);


    GtkPrintDuplex result = gtk_print_settings_get_duplex(GtkWidget_val(self));
CAMLreturn(Val_GtkPrintDuplex(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_double_with_default(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    double result = gtk_print_settings_get_double_with_default(GtkWidget_val(self), String_val(arg1), Double_val(arg2));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_double(value self, value arg1)
{
CAMLparam2(self, arg1);


    double result = gtk_print_settings_get_double(GtkWidget_val(self), String_val(arg1));
CAMLreturn(caml_copy_double(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_dither(value self)
{
CAMLparam1(self);


    const char* result = gtk_print_settings_get_dither(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_default_source(value self)
{
CAMLparam1(self);


    const char* result = gtk_print_settings_get_default_source(GtkWidget_val(self));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_collate(value self)
{
CAMLparam1(self);


    gboolean result = gtk_print_settings_get_collate(GtkWidget_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get_bool(value self, value arg1)
{
CAMLparam2(self, arg1);


    gboolean result = gtk_print_settings_get_bool(GtkWidget_val(self), String_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_get(value self, value arg1)
{
CAMLparam2(self, arg1);


    const char* result = gtk_print_settings_get(GtkWidget_val(self), String_val(arg1));
CAMLreturn(caml_copy_string(result));
}

CAMLexport CAMLprim value ml_gtk_print_settings_foreach(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_print_settings_foreach(GtkWidget_val(self), arg1, arg2);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_settings_copy(value self)
{
CAMLparam1(self);


    GtkPrintSettings* result = gtk_print_settings_copy(GtkWidget_val(self));
CAMLreturn(Val_GtkWidget(result));
}
