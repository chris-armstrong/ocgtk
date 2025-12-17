## Class hirearchy

* Generate all classes in a class hierarchy with #as_<type>, not just those in the Widget hierarchy (e.g. Expression)
* Update methods that take a class value like "#expression_skel" (which means anything polymorphically implementing that interface) to work

i.e.

```
  method set_expression : 'a . ((#GExpression.expression_skel as 'a) option) -> unit = 
    fun expression ->
      let expression = Option.map (fun (c: #GExpression.expression_skel) -> c#as_expression) expression in
      String_filter.set_expression obj expression
```