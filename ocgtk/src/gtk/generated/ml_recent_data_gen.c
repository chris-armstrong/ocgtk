/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RecentData */

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
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"

/* Conversion functions for GtkRecentData (opaque record with hidden fields) */
GtkRecentData *GtkRecentData_val(value v) {
  return (GtkRecentData *)ml_gir_record_ptr_val(v, "GtkRecentData");
}

value Val_GtkRecentData(const GtkRecentData *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkRecentData_option(const GtkRecentData *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkRecentData(ptr));
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_get_display_name(value self)
{
    CAMLparam1(self);
    GtkRecentData *rec = GtkRecentData_val(self);
    CAMLreturn(caml_copy_string(rec->display_name));
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_get_description(value self)
{
    CAMLparam1(self);
    GtkRecentData *rec = GtkRecentData_val(self);
    CAMLreturn(caml_copy_string(rec->description));
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_get_mime_type(value self)
{
    CAMLparam1(self);
    GtkRecentData *rec = GtkRecentData_val(self);
    CAMLreturn(caml_copy_string(rec->mime_type));
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_get_app_name(value self)
{
    CAMLparam1(self);
    GtkRecentData *rec = GtkRecentData_val(self);
    CAMLreturn(caml_copy_string(rec->app_name));
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_get_app_exec(value self)
{
    CAMLparam1(self);
    GtkRecentData *rec = GtkRecentData_val(self);
    CAMLreturn(caml_copy_string(rec->app_exec));
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_get_groups(value self)
{
    CAMLparam1(self);
    GtkRecentData *rec = GtkRecentData_val(self);
    CAMLlocal1(result);
    Val_strv(rec->groups, result);
    CAMLreturn(result);
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_get_is_private(value self)
{
    CAMLparam1(self);
    GtkRecentData *rec = GtkRecentData_val(self);
    CAMLreturn(Val_bool(rec->is_private));
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_set_display_name(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRecentData *rec = GtkRecentData_val(self);
    g_free(rec->display_name);
    rec->display_name = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_set_description(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRecentData *rec = GtkRecentData_val(self);
    g_free(rec->description);
    rec->description = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_set_mime_type(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRecentData *rec = GtkRecentData_val(self);
    g_free(rec->mime_type);
    rec->mime_type = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_set_app_name(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRecentData *rec = GtkRecentData_val(self);
    g_free(rec->app_name);
    rec->app_name = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_set_app_exec(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRecentData *rec = GtkRecentData_val(self);
    g_free(rec->app_exec);
    rec->app_exec = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_set_groups(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRecentData *rec = GtkRecentData_val(self);
    g_strfreev(rec->groups);
    Strv_val(v_val, rec->groups);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_set_is_private(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkRecentData *rec = GtkRecentData_val(self);
    rec->is_private = Bool_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_recent_data_make_native(value v_display_name, value v_description, value v_mime_type, value v_app_name, value v_app_exec, value v_groups, value v_is_private)
{
    CAMLparam5(v_display_name, v_description, v_mime_type, v_app_name, v_app_exec);
CAMLxparam2(v_groups, v_is_private);

    GtkRecentData *obj = g_new0(GtkRecentData, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->display_name = g_strdup(String_val(v_display_name));
    obj->description = g_strdup(String_val(v_description));
    obj->mime_type = g_strdup(String_val(v_mime_type));
    obj->app_name = g_strdup(String_val(v_app_name));
    obj->app_exec = g_strdup(String_val(v_app_exec));
    Strv_val(v_groups, obj->groups);
    obj->is_private = Bool_val(v_is_private);
    CAMLreturn(Val_GtkRecentData(obj));
}
\
CAMLexport CAMLprim value ml_gtk_recent_data_make_bytecode(value * argv, int argn)
{
    return ml_gtk_recent_data_make_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
}

