/* GENERATED CODE - DO NOT EDIT */
/* C bindings for KeymapKey */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include library-specific type conversions and forward declarations */
#include "gdk_decls.h"

/* Conversion functions for GdkKeymapKey (opaque record with hidden fields) */
GdkKeymapKey *GdkKeymapKey_val(value v) {
  return (GdkKeymapKey *)ml_gir_record_ptr_val(v, "GdkKeymapKey");
}

value Val_GdkKeymapKey(const GdkKeymapKey *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_GdkKeymapKey_option(const GdkKeymapKey *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_GdkKeymapKey(ptr));
}

\
CAMLexport CAMLprim value ml_gdk_keymap_key_get_keycode(value self)
{
    CAMLparam1(self);
    GdkKeymapKey *rec = GdkKeymapKey_val(self);
    CAMLreturn(Val_int(rec->keycode));
}

\
CAMLexport CAMLprim value ml_gdk_keymap_key_get_group(value self)
{
    CAMLparam1(self);
    GdkKeymapKey *rec = GdkKeymapKey_val(self);
    CAMLreturn(Val_int(rec->group));
}

\
CAMLexport CAMLprim value ml_gdk_keymap_key_get_level(value self)
{
    CAMLparam1(self);
    GdkKeymapKey *rec = GdkKeymapKey_val(self);
    CAMLreturn(Val_int(rec->level));
}

\
CAMLexport CAMLprim value ml_gdk_keymap_key_set_keycode(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkKeymapKey *rec = GdkKeymapKey_val(self);
    rec->keycode = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_keymap_key_set_group(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkKeymapKey *rec = GdkKeymapKey_val(self);
    rec->group = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_keymap_key_set_level(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GdkKeymapKey *rec = GdkKeymapKey_val(self);
    rec->level = Int_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gdk_keymap_key_make(value v_keycode, value v_group, value v_level)
{
    CAMLparam3(v_keycode, v_group, v_level);
    GdkKeymapKey *obj = g_new0(GdkKeymapKey, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->keycode = Int_val(v_keycode);
    obj->group = Int_val(v_group);
    obj->level = Int_val(v_level);
    CAMLreturn(Val_GdkKeymapKey(obj));
}

