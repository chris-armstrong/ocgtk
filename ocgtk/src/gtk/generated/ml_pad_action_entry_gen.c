/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PadActionEntry */

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

/* Conversion functions for GtkPadActionEntry (opaque record with hidden fields) */
GtkPadActionEntry *GtkPadActionEntry_val(value v) {
  return (GtkPadActionEntry *)ml_gir_record_ptr_val(v, "GtkPadActionEntry");
}

value Val_GtkPadActionEntry(const GtkPadActionEntry *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GtkPadActionEntry_option(const GtkPadActionEntry *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GtkPadActionEntry(ptr));
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_get_type(value self)
{
    CAMLparam1(self);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    CAMLreturn(Val_GtkPadActionType(rec->type));
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_get_index(value self)
{
    CAMLparam1(self);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    CAMLreturn(Val_int(rec->index));
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_get_mode(value self)
{
    CAMLparam1(self);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    CAMLreturn(Val_int(rec->mode));
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_get_label(value self)
{
    CAMLparam1(self);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    CAMLreturn(caml_copy_string(rec->label));
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_get_action_name(value self)
{
    CAMLparam1(self);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    CAMLreturn(caml_copy_string(rec->action_name));
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_set_type(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    rec->type = GtkPadActionType_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_set_index(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    rec->index = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_set_mode(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    rec->mode = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_set_label(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    g_free(rec->label);
    rec->label = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_set_action_name(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GtkPadActionEntry *rec = GtkPadActionEntry_val(self);
    g_free(rec->action_name);
    rec->action_name = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gtk_pad_action_entry_make(value v_type, value v_index, value v_mode, value v_label, value v_action_name)
{
    CAMLparam5(v_type, v_index, v_mode, v_label, v_action_name);
    GtkPadActionEntry *obj = g_new0(GtkPadActionEntry, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->type = GtkPadActionType_val(v_type);
    obj->index = Int_val(v_index);
    obj->mode = Int_val(v_mode);
    obj->label = g_strdup(String_val(v_label));
    obj->action_name = g_strdup(String_val(v_action_name));
    CAMLreturn(Val_GtkPadActionEntry(obj));
}

