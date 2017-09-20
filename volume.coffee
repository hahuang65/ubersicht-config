command: "echo $(~/.dotfiles/ubersicht/scripts/volume)"

refreshFrequency: 500 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/styles.css" />
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/colors.css" />
    <div id="content"></div>
  """

style: """
  right: 240px
  top: 4px
  letter-spacing: -2px
  .icon
    position: relative
    top: -1px
"""

icon: (output) ->
  [vol, muted] = output.split(', ')
  muted = muted.replace(/^\s+|\s+$/g, "") == "true"

  return if muted || vol <= 0
    "fa-volume-off"
  else if vol < 33
    "fa-volume-down"
  else
    "fa-volume-up"

bar: (output) ->
  [vol, muted] = output.split(', ')
  muted = muted.replace(/^\s+|\s+$/g, "") == "true"

  return if muted || vol <= 0
    "----------"
  else if vol < 10
    "|---------"
  else if vol < 20
    "-|--------"
  else if vol < 30
    "--|-------"
  else if vol < 40
    "---|------"
  else if vol < 50
    "----|-----"
  else if vol < 60
    "-----|----"
  else if vol < 70
    "------|---"
  else if vol < 80
    "-------|--"
  else if vol < 90
    "--------|-"
  else
    "---------|"

color: (output) =>
  [vol, muted] = output.split(', ')
  muted = muted.replace(/^\s+|\s+$/g, "") == "true"

  return if muted || vol < 33
    "green"
  else if vol < 66
    "yellow"
  else
    "red"

content: (output) ->
  """
    <span class="#{@color(output)}"><i class="icon fa #{@icon(output)}"></i>#{@bar(output)}</span>
  """

update: (output, domEl) ->
  $(domEl).find('#content').html(@content(output))
