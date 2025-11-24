/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintOperation */

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

/* Type-specific conversion macros for GtkPrintOperation */
#define GtkPrintOperation_val(val) ((GtkPrintOperation*)ext_of_val(val))
#define Val_GtkPrintOperation(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_print_operation_new(value unit)
{
CAMLparam1(unit);
GtkPrintOperation *obj = gtk_print_operation_new();
CAMLreturn(Val_GtkPrintOperation(obj));
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_unit(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_operation_set_unit(GtkPrintOperation_val(self), GtkUnit_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_print_settings(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_operation_set_print_settings(GtkPrintOperation_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_defer_drawing(value self)
{
CAMLparam1(self);


    gtk_print_operation_set_defer_drawing(GtkPrintOperation_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_default_page_setup(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_print_operation_set_default_page_setup(GtkPrintOperation_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_run(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;


    GtkPrintOperationResult result = gtk_print_operation_run(GtkPrintOperation_val(self), GtkPrintOperationAction_val(arg1), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_GtkPrintOperationResult(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_print_operation_is_finished(value self)
{
CAMLparam1(self);


    gboolean result = gtk_print_operation_is_finished(GtkPrintOperation_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_status(value self)
{
CAMLparam1(self);


    GtkPrintStatus result = gtk_print_operation_get_status(GtkPrintOperation_val(self));
CAMLreturn(Val_GtkPrintStatus(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_print_settings(value self)
{
CAMLparam1(self);


    GtkPrintSettings* result = gtk_print_operation_get_print_settings(GtkPrintOperation_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_error(value self)
{
CAMLparam1(self);
GError *error = NULL;


    gtk_print_operation_get_error(GtkPrintOperation_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(ValUnit)); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_default_page_setup(value self)
{
CAMLparam1(self);


    GtkPageSetup* result = gtk_print_operation_get_default_page_setup(GtkPrintOperation_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_draw_page_finish(value self)
{
CAMLparam1(self);


    gtk_print_operation_draw_page_finish(GtkPrintOperation_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_cancel(value self)
{
CAMLparam1(self);


    gtk_print_operation_cancel(GtkPrintOperation_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_allow_async(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "allow-async", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_allow_async(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "allow-async", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_current_page(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "current-page", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_current_page(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "current-page", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_custom_tab_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "custom-tab-label", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_custom_tab_label(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "custom-tab-label", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_embed_page_setup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "embed-page-setup", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_embed_page_setup(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "embed-page-setup", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_export_filename(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "export-filename", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_export_filename(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "export-filename", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_has_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-selection", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_has_selection(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "has-selection", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_job_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "job-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_job_name(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "job-name", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_n_pages(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "n-pages", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_n_pages(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gint c_value = Int_val(new_value);
g_object_set(G_OBJECT(obj), "n-pages", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_n_pages_to_print(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "n-pages-to-print", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_show_progress(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-progress", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_show_progress(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-progress", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_status_string(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "status-string", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_support_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "support-selection", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_support_selection(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "support-selection", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_track_print_status(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "track-print-status", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_track_print_status(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "track-print-status", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_use_full_page(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-full-page", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_use_full_page(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-full-page", c_value, NULL);
CAMLreturn(Val_unit);
}
