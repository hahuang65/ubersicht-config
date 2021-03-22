command: "echo $(~/.dotfiles/ubersicht/scripts/yabai-spaces)"

refreshFrequency: 250 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/styles.css" />
    <link rel="stylesheet" type="text/css" href="/ubersicht.widget/colors.css" />
    <div id="content"></div>
  """

style: """
  left: 10px
  top: 4px
  .icon
    letter-spacing: 2px
"""

spaces: (output) ->
  [space_names, current_space] = output.split("@")
  current_space = current_space.trim()
  space_names = space_names.split(" ")

  html = ""

  for space in space_names
    html += """
      <span class="#{@color(space, current_space)}"><i class="icon fa #{@icon(space)}" aria-hidden="true"></i> </span>
    """

  html

color: (space, current_space) ->
  if space == current_space
    "orange"
  else
    "white"

icon: (space) ->
  if space == "Web"
    "fa-firefox"
  else if space == "Chat"
    "fa-commenting"
  else if space == "Music"
    "fa-music"
  else if space == "Dev"
    "fa-file-code"

content: (output) ->
  """
    #{@spaces(output)}
  """

update: (output, domEl) ->
  $(domEl).find('#content').html(@content(output))
