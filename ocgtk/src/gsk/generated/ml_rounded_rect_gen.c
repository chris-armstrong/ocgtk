/* GENERATED CODE - DO NOT EDIT */
/* C bindings for RoundedRect */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include library-specific type conversions and forward declarations */
#include "gsk_decls.h"

/* Copy function for GskRoundedRect (value-like record with copy method) */
value copy_GskRoundedRect(const GskRoundedRect *ptr)
{
  if (ptr == NULL) return Val_none;
  GskRoundedRect *copy = g_malloc(sizeof(GskRoundedRect));
  memcpy(copy, ptr, sizeof(GskRoundedRect));
  return ml_gir_record_val_ptr(copy);
}


CAMLexport CAMLprim value ml_gsk_rounded_rect_shrink(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

GskRoundedRect* result = gsk_rounded_rect_shrink(GskRoundedRect_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4));
CAMLreturn(Val_GskRoundedRect(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GskRoundedRect* result = gsk_rounded_rect_offset(GskRoundedRect_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_GskRoundedRect(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_normalize(value self)
{
CAMLparam1(self);

GskRoundedRect* result = gsk_rounded_rect_normalize(GskRoundedRect_val(self));
CAMLreturn(Val_GskRoundedRect(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_is_rectilinear(value self)
{
CAMLparam1(self);

gboolean result = gsk_rounded_rect_is_rectilinear(GskRoundedRect_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_intersects_rect(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gsk_rounded_rect_intersects_rect(GskRoundedRect_val(self), graphene_rect_t_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_init_from_rect(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GskRoundedRect* result = gsk_rounded_rect_init_from_rect(GskRoundedRect_val(self), graphene_rect_t_val(arg1), Double_val(arg2));
CAMLreturn(Val_GskRoundedRect(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_init_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

GskRoundedRect* result = gsk_rounded_rect_init(GskRoundedRect_val(self), graphene_rect_t_val(arg1), graphene_size_t_val(arg2), graphene_size_t_val(arg3), graphene_size_t_val(arg4), graphene_size_t_val(arg5));
CAMLreturn(Val_GskRoundedRect(result));}

CAMLexport CAMLprim value ml_gsk_rounded_rect_init_bytecode(value * argv, int argn)
{
return ml_gsk_rounded_rect_init_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_contains_rect(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gsk_rounded_rect_contains_rect(GskRoundedRect_val(self), graphene_rect_t_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_rounded_rect_contains_point(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gsk_rounded_rect_contains_point(GskRoundedRect_val(self), graphene_point_t_val(arg1));
CAMLreturn(Val_bool(result));
}
\
CAMLexport CAMLprim value ml_gsk_rounded_rect_get_bounds(value self)
{
    CAMLparam1(self);
    GskRoundedRect *rec = GskRoundedRect_val(self);
    CAMLreturn(Val_graphene_rect_t(&rec->bounds));
}

\
CAMLexport CAMLprim value ml_gsk_rounded_rect_get_corner(value self)
{
    CAMLparam1(self);
    GskRoundedRect *rec = GskRoundedRect_val(self);
    CAMLlocal1(arr);
    arr = caml_alloc(4, 0);
    for (int i = 0; i < 4; i++)
      caml_modify(&Field(arr, i), Val_graphene_size_t(&rec->corner[i]));
    CAMLreturn(arr);
}

\
CAMLexport CAMLprim value ml_gsk_rounded_rect_set_bounds(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskRoundedRect *rec = GskRoundedRect_val(self);
    rec->bounds = *graphene_rect_t_val(v_val);
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_rounded_rect_set_corner(value self, value v_val)
{
    CAMLparam2(self, v_val);
    GskRoundedRect *rec = GskRoundedRect_val(self);
    for (int i = 0; i < 4; i++)
      rec->corner[i] = *graphene_size_t_val(Field(v_val, i));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_gsk_rounded_rect_make(value v_bounds, value v_corner)
{
    CAMLparam2(v_bounds, v_corner);
    GskRoundedRect *obj = g_new0(GskRoundedRect, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->bounds = *graphene_rect_t_val(v_bounds);
    for (int i = 0; i < 4; i++)
      obj->corner[i] = *graphene_size_t_val(Field(v_corner, i));
    CAMLreturn(Val_GskRoundedRect(obj));
}

