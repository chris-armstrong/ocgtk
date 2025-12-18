/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintOperation */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkPrintOperation */
#ifndef Val_GtkPrintOperation
#define GtkPrintOperation_val(val) ((GtkPrintOperation*)ext_of_val(val))
#define Val_GtkPrintOperation(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPrintOperation */


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

CAMLexport CAMLprim value ml_gtk_print_operation_set_defer_drawing(value self)
{
CAMLparam1(self);

gtk_print_operation_set_defer_drawing(GtkPrintOperation_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_run(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);
GError *error = NULL;

GtkPrintOperationResult result = gtk_print_operation_run(GtkPrintOperation_val(self), GtkPrintOperationAction_val(arg1), Option_val(arg2, GtkWindow_val, NULL), &error);
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

CAMLexport CAMLprim value ml_gtk_print_operation_get_error(value self)
{
CAMLparam1(self);
GError *error = NULL;

gtk_print_operation_get_error(GtkPrintOperation_val(self), &error);
if (error == NULL) CAMLreturn(Res_Ok(ValUnit)); else CAMLreturn(Res_Error(Val_GError(error)));
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
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "allow-async");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_allow_async: property 'allow-async' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "allow-async", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_allow_async(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "allow-async");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_allow_async: property 'allow-async' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "allow-async", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_current_page(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "current-page");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_current_page: property 'current-page' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "current-page", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_current_page(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "current-page");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_current_page: property 'current-page' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "current-page", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_custom_tab_label(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "custom-tab-label");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_custom_tab_label: property 'custom-tab-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "custom-tab-label", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_custom_tab_label(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "custom-tab-label");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_custom_tab_label: property 'custom-tab-label' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "custom-tab-label", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_embed_page_setup(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "embed-page-setup");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_embed_page_setup: property 'embed-page-setup' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "embed-page-setup", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_embed_page_setup(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "embed-page-setup");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_embed_page_setup: property 'embed-page-setup' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "embed-page-setup", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_export_filename(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "export-filename");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_export_filename: property 'export-filename' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "export-filename", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_export_filename(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "export-filename");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_export_filename: property 'export-filename' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "export-filename", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_has_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-selection");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_has_selection: property 'has-selection' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "has-selection", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_has_selection(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "has-selection");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_has_selection: property 'has-selection' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "has-selection", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_job_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "job-name");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_job_name: property 'job-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "job-name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_job_name(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "job-name");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_job_name: property 'job-name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "job-name", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_n_pages(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-pages");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_n_pages: property 'n-pages' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-pages", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_n_pages(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gint c_value = Int_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-pages");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_n_pages: property 'n-pages' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_int(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "n-pages", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_n_pages_to_print(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gint prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "n-pages-to-print");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_n_pages_to_print: property 'n-pages-to-print' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "n-pages-to-print", &prop_gvalue);
    prop_value = (gint)g_value_get_int(&prop_gvalue);

result = Val_int(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_show_progress(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-progress");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_show_progress: property 'show-progress' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "show-progress", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_show_progress(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "show-progress");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_show_progress: property 'show-progress' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "show-progress", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_status_string(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "status-string");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_status_string: property 'status-string' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "status-string", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_support_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "support-selection");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_support_selection: property 'support-selection' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "support-selection", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_support_selection(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "support-selection");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_support_selection: property 'support-selection' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "support-selection", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_track_print_status(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "track-print-status");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_track_print_status: property 'track-print-status' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "track-print-status", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_track_print_status(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "track-print-status");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_track_print_status: property 'track-print-status' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "track-print-status", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_get_use_full_page(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-full-page");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_get_use_full_page: property 'use-full-page' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-full-page", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_print_operation_set_use_full_page(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkPrintOperation *obj = (GtkPrintOperation *)GtkPrintOperation_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-full-page");
if (pspec == NULL) caml_failwith("ml_gtk_print_operation_set_use_full_page: property 'use-full-page' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "use-full-page", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
