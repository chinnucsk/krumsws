%%-*- mode: erlang -*-
{application, krumsws,
 [
  {description, "krumsws"},
  {vsn, "1"},
  {modules, [
             krumsws,
             krumsws_app,
             krumsws_sup,
             krumsws_resource,
             krumsws_products
            ]},
  {registered, []},
  {applications, [
                  kernel,
                  stdlib,
                  crypto,
                  mochiweb,
                  webmachine
                 ]},
  {mod, { krumsws_app, []}},
  {env, []}
 ]}.
