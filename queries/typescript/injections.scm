; createGlobalStyle`<css>`
(call_expression
  function: (identifier) @_name
  (#eq? @_name "createGlobalStyle")
  arguments: (template_string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "styled"))
