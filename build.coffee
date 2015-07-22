#
# http://jostein.be build script
#
# The site is just a single page (index.html),
# with everything embedded using script and
# style tags, and data URI's.

fs      = require 'fs'
path    = require 'path'

coffee  = require 'coffee-script'
uglify  = require 'uglify-js'
sass    = require 'node-sass'
datauri = require 'datauri'
jade    = require 'jade'
watch  = require 'watch'

build = ->
  console.log "Building.."

  jadeScope = {}

  for name in fs.readdirSync("assets")
    uri       = datauri path.join "assets", name
    basename  = path.basename(name, path.extname(name))
    jadeScope[basename] = uri
    jadeScope["bg_"+basename] = "background-image: url(" + uri + ");"

  js = uglify.minify(
    coffee.compile fs.readFileSync("site.coffee", encoding: "utf-8")
    fromString: true)

  css = sass.renderSync
    file:         "site.sass"
    outputStyle:  "compressed"
      
  jadeScope.js  = js.code
  jadeScope.css = css.css.toString("utf-8")

  fs.writeFileSync(
    "index.html"
    jade.renderFile "site.jade", jadeScope
    )
  console.log "Done."
  console.log "Watching for changes.."

filter = (name) ->
  switch name
    when "index.html", "build.coffee" then false
    else true

watch.watchTree(
  "."
  {ignoreDotFiles: true, filter: filter}
  build)


