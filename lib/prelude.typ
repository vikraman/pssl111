#let page(
  site: "PSSL 111",
  name: none,
  css: (),
  content,
) = {
  let title = site + " - " + name
  set document(title: title)

  html.elem("html", attrs: (lang: "en"), {
    html.elem("head", {
      html.elem("meta", attrs: (charset: "utf-8"))
      html.elem("meta", attrs: (
        name: "viewport",
        content: "width=device-width, initial-scale=1",
      ))
      html.elem("meta", attrs: (
        name: "color-scheme",
        content: "light dark",
      ))
      html.elem("link", attrs: (
        rel: "stylesheet",
        href: "https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.fluid.classless.red.min.css",
      ))
      for ss in css {
        html.elem("link", attrs: (rel: "stylesheet", href: ss))
      }
      html.elem("title", title)
    })
    html.elem("body", {
      html.elem("main", content)
    })
  })
}
