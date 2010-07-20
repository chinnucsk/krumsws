%%-*- mode: erlang -*-
{application, krumsws,
 [
  {description, "krumsws"},
  {vsn, "1"},
  {modules, [
             krumsws,
             krumsws_app,
             krumsws_utility,
             krumsws_sup,
             krumsws_home,
             krumsws_product
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
